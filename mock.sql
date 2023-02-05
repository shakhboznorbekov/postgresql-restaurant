INSERT INTO categories(name) VALUES (
    ('Milliy taomlar'),
    ('Yevropa taomlari'),
    ('Turk taomlari'),
);

INSERT INTO types(name) VALUES (
    ('Quyuq ovqatlar'), 
    ('Suyuq ovqatlar'), 
    ('Ichimliklar'), 
    ('Shirinliklar'), 
    ('Salatlar')
);

INSERT INTO type_registor (category_id, type_id) VALUES (
    (1, 1), 
    (1, 2), 
    (1, 3), 
    (1, 5),
    (2, 4),
    (3, 3),
    (3, 4)
);

SELECT
    t.name
FROM 
    type_register AS r
NATURAL JOIN 
    types as t
WHERE 
    r.category_id = 3
;

INSERT INTO products (name, price, type_register_id) VALUES (
    ('Osh', 18000, 1), 
    ('Lag''mon', 12000, 1), 
    ('Dimlama', 20000, 1)
);

//product_name
SELECT
    p.name
FROM 
    type_register as r
NATURAL JOIN
    products as p
WHERE
    r.type_register_id = 1 AND r.category_id = 1
;

INSERT INTO components (name) VALUES (
    ('Sabzi'), 
    ('Guruch'), 
    ('Kartoshka'), 
    ('Go''sht'), 
    ('Piyoz'), 
    ('Karam')
);

INSERT INTO ingredients (product_id, component_id, weight) VALUES (
    (1, 1, 1000), 
    (1, 2, 1300), 
    (1, 4, 400), 
    (2, 1, 700),
    (2, 6, 1000),
    (2, 5, 300),
    (3, 3, 2000),
    (3, 4, 1000),
    (3, 5, 900),
    (3, 6, 850)
);

-- Components Name

SELECT
    c.name
FROM
    ingredients AS i
NATURAL JOIN
    components AS c
WHERE
    i.product_id = 1
;



INSERT INTO tables (number) VALUES (1), (2), (3);

INSERT INTO orders (table_id) VALUES (2), (1), (3);

INSERT INTO order_details (quantity, order_id, product_id) VALUES (2, 3, 1);
INSERT INTO order_details (order_id, product_id) VALUES (3, 3);
INSERT INTO order_details (quantity, order_id, product_id) VALUES (3, 1, 2);


UPDATE 
orders 
SET closed_at = current_timestamp
WHERE order_id = 2;


-- Max

SELECT 
    count(o.quantity) AS quantity,
    p.name
FROM
    order_details AS o
NATURAL JOIN
    products AS p
GROUP BY
    p.name
ORDER BY
    quantity DESC
;
