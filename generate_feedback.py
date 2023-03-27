import pandas as pd
import random

orders = pd.read_csv('orders.csv', index_col=False)
order_ids = orders['order_id'].unique()
staff_ids = []
for order_id in order_ids:
    staff_id = orders[orders['order_id'] == order_id]['staff_id'].values[0]
    print(staff_id)
    staff_ids.append(staff_id)

print('order_ids', order_ids)
print('staff_ids', staff_ids)
feedback_ids = list(range(1, len(order_ids) + 1))
ratings = []

for i in range(len(order_ids)):
    ratings.append(random.randint(1, 5))

df_feedback = pd.DataFrame(
    {
        'feedback_id' : feedback_ids,
        'rating' : ratings,
        'staff_id' : staff_ids,
        'order_id' : order_ids
    }
)

df_feedback.to_csv('feedback.csv', index=False)