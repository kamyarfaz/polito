import os
import random

from pathlib import Path

if __name__ == '__main__':
    items_path = Path('items.txt')
    ads_sales_path = Path('ads_sales.txt')
    categories = {
        'Cat1': ['Item1'],
        'Cat2': ['Item2', 'Item3', 'Item4', 'Item7', 'Item8'],
        'Cat3': ['Item5', 'Item6', 'Item9', 'Item10']
    }

    # itemId, recommended Price
    DEFAULT_PRICE = 750
    items = {
        'Item1': 150,
        'Item2': 250,
        'Item3': 500,
        'Item4': 10,
        'Item5': 65,
        'Item6': 54
    }

    # nsold -> [(quantity, price)...]
    # nunsold -> quantity
    ads_sales = {
        'Item1': {
            2019: {
                'nsold': [(10, 10)],
                'nunsold': 100
            },
            2020: {
                'nsold': [(50, 110)],
                'nunsold': 10
            }
        },
        'Item2': {
            2020: {
                'nsold': [(91, 255), (9, 1)],
                'nunsold': 0
            }
        },
        'Item3': {
            2020: {
                'nsold': [(89, 499), (11, 1000)],
                'nunsold': 2
            }
        },
        'Item4': {
            2020: {
                'nsold': [(0, 0)],
                'nunsold': 0
            }
        },
        'Item5': {
            2020: {
                'nsold': [(0, 0)],
                'nunsold': 0
            }
        },
        'Item6': {
            2020: {
                'nsold': [(0, 0)],
                'nunsold': 0
            }
        },
        'Item7': {
            2020: {
                'nsold': [(0, 0)],
                'nunsold': 0
            }
        },
        'Item8': {
            2020: {
                'nsold': [(0, 0)],
                'nunsold': 0
            }
        },
        'Item9': {
            2020: {
                'nsold': [(99, 1)],
                'nunsold': 5
            }
        },
        'Item10': {
            2020: {
                'nsold': [(55, 1.5)],
                'nunsold': 123
            }
        }
    }

    with open(items_path, 'w') as fp1, open(ads_sales_path, 'w') as fp2:
        for category in categories:
            for item in categories[category]:
                recom_price = items.get(item, DEFAULT_PRICE)
                fp1.write(f'{item},name,{recom_price},{category}\n')

                for year in ads_sales[item]:
                    nsold = ads_sales[item][year]['nsold']
                    nunsold = ads_sales[item][year]['nunsold']

                    for cnt, price in nsold:
                        for idx in range(cnt):
                            fp2.write(f'{year}/01/01-01:00:00,Username,{item},true,{price}\n')
                    for idx in range(nunsold):
                        fp2.write(f'{year}/01/01-01:00:00,Username,{item},false,0\n')