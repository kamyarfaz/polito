import os

from pathlib import Path
from collections import defaultdict
from random import Random

def get_number_and_price(rand: Random, config_dict, model, country):
    k = model
    if not model in config_dict:
        k = 'default'
    config_subdict = config_dict[k]
    if not isinstance(config_subdict, dict):
        return config_subdict
    if country in config_subdict:
        config_data = config_subdict[country]
    else:
        config_data = config_dict['default']

    return config_data
    

if __name__ == '__main__':
    seed = 47
    r = Random(seed)
    basepath = Path('data')
    if not basepath.is_dir():
        basepath.mkdir()

    model_ids = {
        'FIAT': [
            'Panda',
            'Tipo',
            '500'
        ],
        'M1': [
            'A',
            'B',
            'C'
        ],
        'M2': [
            'D',
            'E',
            'F'
        ]
    }

    countries = ['Italy', 'France', 'Spain', 'Germany', 'USA', 'Canada']
    years = [2017, 2018, 2019, 2020]

    sales = {
        'Tipo': {
            'Italy': (30, 55500),
            'France': (3, 30000),
            'Spain': (32, 34000),
            'Germany': (10, 57000),
            'USA': (23, 60000),
            'Canada': (24, 59000)
        },
        'Panda': {
            'Italy': (3, 55500),
            'France': (3, 30000),
            'Spain': (32, 34000),
            'Germany': (10, 57000),
            'USA': (23, 60000),
            'Canada': (24, 59000)
        },
        'default': (1, 10000),
        'A': {
            'Italy': (100, 10000),
            'France': (100, 10000),
            'Spain': (100, 10000),
            'Germany': (100, 10000),
            'USA': (100, 10000),
            'Canada': (100, 10000),
        }
    }

    incremental_dict = {
        'A': True,
        'B': False,
        'C': True,
        'Panda': 'alternate',
        'Tipo': True
    }
    status_dict = defaultdict(bool)

    # CarModels.txt generation
    with open(basepath / 'CarModels.txt', 'w') as fp:
        for manufacturer in model_ids:
            for model_name in model_ids[manufacturer]:
                fp.write(f'{model_name},{model_name},{manufacturer}\n')
    
    # SalesEU.txt generation
    sid = 1
    carId = 1
    with open(basepath / 'SalesEU.txt', 'w') as fp:
        with open(basepath / 'SalesExtraEU.txt', 'w') as fd:
            for country in countries:
                if country in {'Italy', 'France', 'Spain', 'Germany'}:
                    eu = True
                else:
                    eu = False
                for manufacturer in model_ids:
                    for model_name in model_ids[manufacturer]:
                        for idx, year in enumerate(years):
                            n, price = get_number_and_price(r, sales, model_name, country)
                            if model_name in incremental_dict:
                                if incremental_dict[model_name] == True:
                                    n += idx
                                elif incremental_dict[model_name] == 'alternate':
                                    if status_dict[model_name]:
                                        n += idx
                                        status_dict[model_name] = not status_dict[model_name]

                            for month in range(1, 13):
                                for i in range(n):
                                    res_str = f'{sid},{carId},{model_name},{year}/{month}/01,{country},{price}\n'
                                    if eu:
                                        fp.write(res_str)
                                    else:
                                        fd.write(res_str)
                                    sid += 1
                                    carId += 1

