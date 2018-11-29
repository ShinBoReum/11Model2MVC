
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;
DROP SEQUENCE seq_transaction_brand_id;


CREATE SEQUENCE seq_product_prod_no		 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_brand_brand_id	INCREMENT BY 1 START WITH 100;


alter table product add (brand_id NUMBER not null REFERENCES brand(brand_id));


CREATE TABLE users ( 
	user_id 			VARCHAR2(20)	NOT NULL,
	user_name 	VARCHAR2(50)	NOT NULL,
	password 		VARCHAR2(10)	NOT NULL,
	role 					VARCHAR2(5) 		DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone 		VARCHAR2(14),
	addr 				VARCHAR2(100),
	email 				VARCHAR2(50),
	reg_date 		DATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 				NUMBER 				NOT NULL,
	brand_id				NUMBER    NOT NULL REFERENCES brand(brand_id),	
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 			VARCHAR2(200),
	manufacture_day			VARCHAR2(8),
	price 							NUMBER(10),
	image_file 					VARCHAR2(100),
	reg_date 					DATE,
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 					NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option		CHAR(3),
	receiver_name 		VARCHAR2(20),
	receiver_phone		VARCHAR2(14),
	demailaddr 			VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code	CHAR(3),
	order_data 			DATE,
	dlvy_date 				DATE,
	PRIMARY KEY(tran_no)
);

CREATE TABLE brand ( 
	brand_id                    NUMBER 			NOT NULL,          
	national 					VARCHAR2(10) 	NOT NULL,
	brandName                   VARCHAR2(20)    NOT NULL,
	PRIMARY KEY(brand_id)
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           
insert into product values (seq_product_prod_no.nextval, '911 카레라','스포츠카','20180911',154200000, '911.png',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),116);
insert into product values (seq_product_prod_no.nextval, '마칸','중형 SUV','20181010',75600000, 'macan.png',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),116);
insert into product values (seq_product_prod_no.nextval, 'C클래스 AMG 63','중형 세단','20180518',128000000, 'c_amg_63.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),115);
insert into product values (seq_product_prod_no.nextval, 'xc60','중형 SUV','20181101', 75400000, 'xc60.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),117);
insert into product values (seq_product_prod_no.nextval, 'xc40','소형 SUV','20180101', 50800000, 'xc40.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),117);
insert into product values (seq_product_prod_no.nextval, '카니발 하이리무진','대형차','20180201',59780000, 'hi.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),111);
insert into product values (seq_product_prod_no.nextval, '기블리','고급 세단','20180704',144000000, 'mg.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),118);
insert into product values (seq_product_prod_no.nextval, '컨트리맨','소형 SUV','20181104',44400000, 'mini.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),119);


insert into brand values (seq_brand_brand_id.nextval,'국산','현대');
insert into brand values (seq_brand_brand_id.nextval,'국산','기아');
insert into brand values (seq_brand_brand_id.nextval,'국산','르노');
insert into brand values (seq_brand_brand_id.nextval,'국산','쌍용');
insert into brand values (seq_brand_brand_id.nextval,'국산','쉐보레');
insert into brand values (seq_brand_brand_id.nextval,'수입','벤츠');
insert into brand values (seq_brand_brand_id.nextval,'수입','포르쉐');
insert into brand values (seq_brand_brand_id.nextval,'수입','볼보');
insert into brand values (seq_brand_brand_id.nextval,'수입','마세라티');
insert into brand values (seq_brand_brand_id.nextval,'수입','미니쿠퍼');

commit;



//== Page 처리을 위한 SQL 구성연습

SELECT user_id , user_name , email
FROM users
ORDER BY user_id

currentPage =2
pageSize = 3   
4 ~ 6

SELECT inner_table. * ,  ROWNUM AS row_seq
FROM (	SELECT user_id , user_name , email
				FROM users
				ORDER BY user_id ) inner_table
WHERE ROWNUM <=6;	
//==>           currentPage * paseSize


SELECT * 
FROM (	SELECT inner_table. * ,  ROWNUM AS row_seq
				FROM (	SELECT user_id , user_name , email
								FROM users
								ORDER BY user_id ) inner_table
				WHERE ROWNUM <=6 )
WHERE row_seq BETWEEN 4 AND 6;

//==> (currentPage-1) * paseSize+1           currentPage * paseSize