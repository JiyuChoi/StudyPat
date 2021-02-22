
-- sp_user Table Create SQL
CREATE TABLE sp_user
(
    user_no     INT             NOT NULL, 
    id          VARCHAR2(20)    NOT NULL, 
    password    VARCHAR2(30)    NOT NULL, 
    email       VARCHAR2(50)    NOT NULL, 
    nickname    VARCHAR2(30)    NOT NULL, 
    admin       CHAR(1)         NULL, 
    CONSTRAINT SP_USER_PK PRIMARY KEY (user_no)
)
/

alter table sp_user add unique(id)

CREATE SEQUENCE sp_user_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER sp_user_AI_TRG
BEFORE INSERT ON sp_user 
REFERENCING NEW AS NEW FOR EACH ROW s
BEGIN 
    SELECT sp_user_SEQ.NEXTVAL
    INTO :NEW.user_no
    FROM DUAL;
END;
/

--DROP TRIGGER sp_user_AI_TRG;
/

--DROP SEQUENCE sp_user_SEQ;
/

COMMENT ON TABLE sp_user IS '사용자'
/


-- sp_user Table Create SQL
CREATE TABLE sp_post
(
    post_no        INT              NOT NULL, 
    user_no        INT              NOT NULL, 
    title          VARCHAR2(200)    NOT NULL, 
    post_text      CLOB             NOT NULL, 
    category       VARCHAR2(50)     NOT NULL, 
    recruit_no     INT              NOT NULL, 
    area           VARCHAR2(50)     NOT NULL, 
    create_date    DATE             NOT NULL, 
    view_count     INT              NOT NULL, 
    report         INT              NULL, 
    CONSTRAINT SP_POST_PK PRIMARY KEY (post_no)
)
/

CREATE SEQUENCE sp_post_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER sp_post_AI_TRG
BEFORE INSERT ON sp_post 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT sp_post_SEQ.NEXTVAL
    INTO :NEW.post_no
    FROM DUAL;
END;
/

--DROP TRIGGER sp_post_AI_TRG;
/

--DROP SEQUENCE sp_post_SEQ;
/

ALTER TABLE sp_post
    ADD CONSTRAINT FK_sp_post_user_no_sp_user_use FOREIGN KEY (user_no)
        REFERENCES sp_user (user_no)
/


-- sp_user Table Create SQL
CREATE TABLE sp_comment
(
    comment_no      INT        NOT NULL, 
    post_no         INT        NOT NULL, 
    user_no         INT        NOT NULL, 
    comment_text    CLOB       NOT NULL, 
    create_date     DATE       NOT NULL, 
    secret          CHAR(1)    NOT NULL, 
    CONSTRAINT SP_COMMENT_PK PRIMARY KEY (comment_no)
)
/

CREATE SEQUENCE sp_comment_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER sp_comment_AI_TRG
BEFORE INSERT ON sp_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT sp_comment_SEQ.NEXTVAL
    INTO :NEW.comment_no
    FROM DUAL;
END;
/

--DROP TRIGGER sp_comment_AI_TRG;
/

--DROP SEQUENCE sp_comment_SEQ;
/

ALTER TABLE sp_comment
    ADD CONSTRAINT FK_sp_comment_post_no_sp_post_ FOREIGN KEY (post_no)
        REFERENCES sp_post (post_no)
/

ALTER TABLE sp_comment
    ADD CONSTRAINT FK_sp_comment_user_no_sp_user_ FOREIGN KEY (user_no)
        REFERENCES sp_user (user_no)
/


-- sp_user Table Create SQL
CREATE TABLE sp_scrap
(
    scrap_no    INT    NOT NULL, 
    user_no     INT    NOT NULL, 
    post_no     INT    NOT NULL,
    CONSTRAINT SP_SCRAP_PK PRIMARY KEY (user_no, post_no)
)
/

CREATE SEQUENCE sp_scrap_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER sp_scrap_AI_TRG
BEFORE INSERT ON sp_scrap 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT sp_scrap_SEQ.NEXTVAL
    INTO :NEW.scrap_no
    FROM DUAL;
END;
/

--DROP TRIGGER sp_scrap_AI_TRG;
/

--DROP SEQUENCE sp_scrap_SEQ;
/

ALTER TABLE sp_scrap
    ADD CONSTRAINT FK_sp_scrap_user_no_sp_user_us FOREIGN KEY (user_no)
        REFERENCES sp_user (user_no)
/

ALTER TABLE sp_scrap
    ADD CONSTRAINT FK_sp_scrap_post_no_sp_post_po FOREIGN KEY (post_no)
        REFERENCES sp_post (post_no)
/


-- sp_user Table Create SQL
CREATE TABLE sp_recommend
(
    recommend_no    INT    NOT NULL, 
    user_no         INT    NOT NULL, 
    post_no         INT    NOT NULL, 
    CONSTRAINT SP_RECOMMEND_PK PRIMARY KEY (recommend_no)
)
/

CREATE SEQUENCE sp_recommend_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER sp_recommend_AI_TRG
BEFORE INSERT ON sp_recommend 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT sp_recommend_SEQ.NEXTVAL
    INTO :NEW.recommend_no
    FROM DUAL;
END;
/

--DROP TRIGGER sp_recommend_AI_TRG;
/

--DROP SEQUENCE sp_recommend_SEQ;
/

ALTER TABLE sp_recommend
    ADD CONSTRAINT FK_sp_recommend_user_no_sp_use FOREIGN KEY (user_no)
        REFERENCES sp_user (user_no)
/

ALTER TABLE sp_recommend
    ADD CONSTRAINT FK_sp_recommend_post_no_sp_pos FOREIGN KEY (post_no)
        REFERENCES sp_post (post_no)
/


-- sp_user Table Create SQL
CREATE TABLE sp_tag
(
    tag_no      INT             NOT NULL, 
    tag_name    VARCHAR2(30)    NULL, 
    post_no     INT             NULL, 
    CONSTRAINT SP_TAG_PK PRIMARY KEY (tag_no)
)
/

CREATE SEQUENCE sp_tag_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER sp_tag_AI_TRG
BEFORE INSERT ON sp_tag 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT sp_tag_SEQ.NEXTVAL
    INTO :NEW.tag_no
    FROM DUAL;
END;
/

--DROP TRIGGER sp_tag_AI_TRG;
/

--DROP SEQUENCE sp_tag_SEQ;
/



select nickname from sp_user join sp_post using(user_no) where post_no = 4;


select * from sp_user join sp_post using(user_no) where post_no = 4;

