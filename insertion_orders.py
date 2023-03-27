from operator import index
import random
import pandas as pd
#import typing
import datetime 

items = pd.read_csv('items.csv')

payment_ids = list(range(10, 1000))
customer_ids = list(range(1, 13))
item_ids = list(range(1, 21))
order_ids = list(range(1, 41))
order_types = ['Pickup', 'Delivery']
staff_ids = list(range(1, 7))

order_id_list = []
payment_id_list = []
customer_id_list = []
item_id_list = []
ts_list = []
order_type_list = []
units_list = []
payment_list = []
id_list = []
staff_id_list = []
year =  2022
month = 6
payment_id_payments_list = []
payment_amount_list = []
item_id_removed = []
cnt = 1
for i in range(40):
    id = i
    order_id = random.choice(order_ids)
    payment_id = random.choice(payment_ids)
    customer_id = random.choice(customer_ids)
    staff_id = random.choice(staff_ids)
    tmp_prices_total = 0
    # customer_ids.remove(customer_id)
    payment_ids.remove(payment_id)
    order_ids.remove(order_id)
    order_type = random.choice(order_types)
    
    ts = datetime.datetime(year, month, random.randint(1, 30), random.randint(5, 23), random.randint(0, 59), random.randint(0, 59))
    for j in range(random.randint(1, 10)):
        price_total = 0
        item_id = random.choice(item_ids)
        units = random.randint(1, 5)
        # price_total = units * items['item_price'][item_id]
        # tmp_prices_total += price_total
        id_list.append(cnt)
        units_list.append(units)
        order_type_list.append(order_type)
        customer_id_list.append(customer_id)
        payment_id_list.append(payment_id)
        order_id_list.append(order_id)
        staff_id_list.append(staff_id)
        ts_list.append(ts)
        item_id_list.append(item_id)
        item_ids.remove(item_id)
        item_id_removed.append(item_id)
        cnt += 1

    item_ids = item_ids + item_id_removed
    item_id_removed.clear()

print(len(id_list))
print(len(units_list))
print(len(order_type_list))
print(len(customer_id_list))
print(len(payment_id_list))
print(len(order_id_list))
print(len(staff_id_list))
print(len(ts_list))

    # payment_id_payments_list.append(payment_id)
    # payment_amount_list.append(tmp_prices_total)
    
    
df_orders = pd.DataFrame(
    {
        'id': id_list,
        'order_id' : order_id_list,
        'item_id' : item_id_list,
        'customer_id': customer_id_list,
        'units' : units_list,
        'payment_id': payment_id_list,
        'order_type' : order_type_list,
        'ts' : ts_list,
        'staff_id': staff_id_list,
    },
)


df_orders.to_csv('orders.csv', index=False)



