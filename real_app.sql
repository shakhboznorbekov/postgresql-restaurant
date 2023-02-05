//components-homashyolar
CREATE TABLE components (
    id UUID PRIMARY KEY gen_random_uuid (),
    name VARCHAR(255) NOT NULL
);

//categories-kategoriyalar
CREATE TABLE categories (
    id UUID PRIMARY KEY gen_random_uuid (),
    name VARCHAR(255) NOT NULL
);

//types-mahsulot turlari
CREATE TABLE types (
    id UUID PRIMARY KEY gen_random_uuid (),
    name VARCHAR(255) NOT NULL
);

//type_registor-qaysi kategoriyada qanaqa mahsulot borligi
CREATE TABLE type_registor (
    id UUID PRIMARY KEY gen_random_uuid (),
    category_id UUID REFERENCES categories(id),
    type_id UUID REFERENCES types(id)
);

//tables-stollar
CREATE TABLE tables (
    id UUID PRIMARY KEY gen_random_uuid (),
    number int2 NOT NULL
);

//products-tayyor mahsulotlar
CREATE TABLE products (
    id UUID PRIMARY KEY gen_random_uuid (),
    name VARCHAR(255) NOT NULL,
    price DECIMAL(16, 2) NOT NULL,
    type_registor_id UUID REFERENCES type_registor(id)
);

//ingredients-retseptlar
CREATE TABLE ingredients (
    id UUID PRIMARY KEY gen_random_uuid (),
    product_id UUID REFERENCES products(id),
    component_id UUID REFERENCES components(id),
    weihgt  int2 NOT NULL
);

//orders-buyurtmalar
CREATE TABLE orders (
    id UUID PRIMARY KEY gen_random_uuid (),
    table_id UUID REFERENCES tables(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    closed_at TIMESTAMP WITH TIME ZONE DEFAULT NULL
);

//order_details-buyurtma tavsilotlari
CREATE TABLE order_details (
    id UUID PRIMARY KEY gen_random_uuid (),
    quantity int2 DEFAULT 1,
    order_id UUID REFERENCES orders(id),
    product_id UUID REFERENCES products(id)
);


