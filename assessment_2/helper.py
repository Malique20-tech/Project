import requests
import json

def fetch_listings(page_num):
    url = f"https://search.mudah.my/v1/search?category=2000&from={page_num}&include=extra_images%2Cbody&limit=40&region=12"
    payload = {}
    headers = {
        'accept': '*/*',
        'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
        'cache-control': 'no-cache',
        'origin': 'https://www.mudah.my',
        'pragma': 'no-cache',
        'priority': 'u=1, i',
        'referer': 'https://www.mudah.my/',
        'sec-ch-ua': '"Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"macOS"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-site',
        'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',
        'Cookie': '__cf_bm=fe_TvIAs5eIiXJXKleI6o4UHNKSRyA7f3EPWx.a6cZc-1720185076-1.0.1.1-o34ACOPze8XSTufO8CpGFqBP0N4dNULkGML1uORwPwJybqItEOxzpg838GqgRy.n1KSx2WHqCaZ9G18HuxnWpw'
    }

    response = requests.request("GET", url, headers=headers, data=payload)
    response.raise_for_status()
    json_loaded = json.loads(response.text)
    attributes = json_loaded['data']
    
    listings = []
    for a in attributes:
        data = {
            'id': a['id'],
            'ads_name': a['attributes']['subject'],
            'ads_datetime': a['attributes']['date'],
            'location': a['attributes']['subarea_name'],
            'price': a['attributes']['price_label'],
            'properties_type': a['attributes']['category_name'],
            'sqft': a['attributes']['size']
        }
        listings.append(data)
    
    return listings
