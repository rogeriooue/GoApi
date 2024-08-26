-- Table: public.product

-- DROP TABLE IF EXISTS public.product;

-- Create sequence for product ID
CREATE SEQUENCE IF NOT EXISTS product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE IF NOT EXISTS public.product
(
    id integer NOT NULL DEFAULT nextval('product_id_seq'::regclass),
    product_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product
    OWNER to postgres;