import pandas as pd
from helper import fetch_listings

all_listing = []

for page_num in range(120):
    try:
        print(f"Fetching page {page_num}")
        listings = fetch_listings(page_num)
        all_listing.extend(listings)
    except Exception as e:
        print(e)
        continue

# Convert the list of dictionaries to a DataFrame
df = pd.DataFrame(all_listing)

# Store the DataFrame in a Parquet file
df.to_parquet('listings.parquet', index=False)

print("Data stored in listings.parquet")
