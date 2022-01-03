CREATE TABLE client (
    client_id INT GENERATED ALWAYS AS IDENTITY,
    email varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,

    PRIMARY KEY(client_id)
);

CREATE TABLE address (
    address_id INT GENERATED ALWAYS AS IDENTITY,
    country varchar(100) NOT NULL,
    state_province varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    client_id INT,

    PRIMARY KEY(address_id),

    CONSTRAINT fk_client
        FOREIGN KEY (client_id)
            REFERENCES client(client_id)
);

CREATE TABLE account (
    account_id INT GENERATED ALWAYS AS IDENTITY,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,

    client_id INT,

    PRIMARY KEY(account_id),

    CONSTRAINT fk_client
        FOREIGN KEY (client_id)
            REFERENCES client(client_id)
);

CREATE TABLE transaction (
    transaction_id INT GENERATED ALWAYS AS IDENTITY,
    account_id INT,
    transaction_date TIMESTAMP(103),
    transaction_type varchar(10) NOT NULL,
    description  varchar(100) NOT NULL,
    value numeric,

    PRIMARY KEY(transaction_id),

    CONSTRAINT fk_account
        FOREIGN KEY (account_id)
            REFERENCES account(account_id)
);
