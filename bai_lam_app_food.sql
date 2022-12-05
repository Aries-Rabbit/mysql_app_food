-- Bài làm
-- Lấy ra 5 người like nhiều nhất
SELECT users.user_id, users.full_name, users.email, 
COUNT(like_res.user_id) as total_like
FROM users 
LEFT JOIN like_res
ON users.user_id = like_res.user_id
GROUP BY users.user_id
ORDER BY total_like DESC
Limit 5;

-- Lấy ra 2 nhà hàng có lượt like nhiều nhất 
SELECT restaurant.res_id, restaurant.res_name,
COUNT(like_res.res_id) as total_like
FROM restaurant 
LEFT JOIN like_res
ON restaurant.res_id = like_res.res_id
GROUP BY restaurant.res_id
ORDER BY total_like DESC
Limit 2;

-- Lấy ra người đặt hàng nhiều nhất 
SELECT users.user_id, users.full_name, users.email, 
COUNT(orders.user_id) as total_order
FROM users 
LEFT JOIN orders
ON users.user_id = orders.user_id
GROUP BY users.user_id
ORDER BY total_order DESC
Limit 1;

-- Chọn ra user không làm gì cả (k đặt hàng, k đánh giá, k like)
SELECT users.user_id, users.full_name, users.email 
FROM users 
WHERE users.user_id IN
(SELECT users.user_id FROM users 
EXCEPT
SELECT like_res.user_id FROM like_res);

-- Tính trung bình sub_food của một food average 
SELECT food.food_id, food.food_name,
ROUND(AVG(sub_food.sub_price),2) as average_sub_price
FROM food 
INNER JOIN sub_food
ON food.food_id = sub_food.food_id
GROUP BY food.food_id;






