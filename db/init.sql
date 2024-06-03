CREATE TABLE IF NOT EXISTS item (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 4) NOT NULL,
    count BIGINT NOT NULL,
    date_created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    date_updated TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS item_name_idx ON item(name);
CREATE TABLE IF NOT EXISTS "order" (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    item_id UUID REFERENCES item(id) NOT NULL,
    user_id UUID NOT NULL,
    amount_bought BIGINT NOT NULL,
    date_created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
INSERT INTO item(name, price, count) VALUES('Cards', 1.00, 5);
INSERT INTO item(name, price, count) VALUES('Soap', 3.00, 4);
INSERT INTO item(name, price, count) VALUES('Broom', 2.50, 2);
INSERT INTO item(name, price, count) VALUES('Tissues', 3.25, 10);