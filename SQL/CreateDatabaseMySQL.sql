-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema swp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema swp
-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quiz_practice` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;



-- -----------------------------------------------------
-- Table `swp`.`account`
-- -----------------------------------------------------


USE `quiz_practice` ;


-- -----------------------------------------------------
-- Table `quiz_practice`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`users` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(256) NOT NULL,
  `first_name` VARCHAR(256) CHARACTER SET 'utf8mb4' ,
  `last_name` VARCHAR(256) CHARACTER SET 'utf8mb4',
  `email` VARCHAR(256) DEFAULT NULL,
  `mobile` INT  DEFAULT NULL,
  `gender` BIT(1)  DEFAULT NULL,
  `create_date` DATE  DEFAULT NULL,
  `image` VARCHAR(256)  DEFAULT NULL,
  `is_enabled` BIT  DEFAULT NULL,
  `role` VARCHAR(256) NOT NULL ,
  PRIMARY KEY (`user_id`),
  INDEX `role` (`role` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`subjectcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`subject_category` (
  `cate_id` INT NOT NULL AUTO_INCREMENT,
  `cate_name` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  PRIMARY KEY (`cate_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`subject` (
  `subject_id` BIGINT NOT NULL AUTO_INCREMENT,
  `subject_name` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `cate_id` INT NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  `image` VARCHAR(256) NULL DEFAULT NULL,
  `description` TEXT CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`subject_id`),
  INDEX `cate_id` (`cate_id` ASC) VISIBLE,
  CONSTRAINT `subject_ibfk_1`
    FOREIGN KEY (`cate_id`)
    REFERENCES `quiz_practice`.`subject_category` (`cate_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `quiz_practice`.`subjecttopic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`subject_topic` (
  `topic_id` BIGINT NOT NULL AUTO_INCREMENT,
  `topic_name` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  `subject_topic_order` INT NULL DEFAULT NULL,
  `subject_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `subject_topic_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`lessontype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`lesson_type` (
  `lesson_type_id` INT NOT NULL AUTO_INCREMENT,
  `lesson_type_name` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  PRIMARY KEY (`lesson_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`lesson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`lesson` (
  `lesson_id` BIGINT NOT NULL AUTO_INCREMENT,
  `lesson_name` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  `lesson_order` INT NULL DEFAULT NULL,
  `video_link` VARCHAR(256) NULL DEFAULT NULL,
  `topic_id` BIGINT NULL DEFAULT NULL,
  `lesson_type_id` INT NULL DEFAULT NULL,
  `lesson_content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`lesson_id`),
  INDEX `topic_id` (`topic_id` ASC) VISIBLE,
  INDEX `lesson_type_id` (`lesson_type_id` ASC) VISIBLE,
  CONSTRAINT `lesson_ibfk_1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `quiz_practice`.`subject_topic` (`topic_id`),
  CONSTRAINT `lesson_ibfk_2`
    FOREIGN KEY (`lesson_type_id`)
    REFERENCES `quiz_practice`.`lesson_type` (`lesson_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`postcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`post_category` (
  `post_cate_id` INT NOT NULL AUTO_INCREMENT,
  `post_cate_name` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  PRIMARY KEY (`post_cate_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`post` (
  `post_id` BIGINT NOT NULL AUTO_INCREMENT,
  `post_data` TEXT NULL DEFAULT NULL,
  `post_cate_id` INT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  `image` VARCHAR(256) NULL DEFAULT NULL,
  `date_create` DATETIME NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  `brief_info` TEXT CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `title` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `post_cate_id` (`post_cate_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `post_ibfk_1`
    FOREIGN KEY (`post_cate_id`)
    REFERENCES `quiz_practice`.`post_category` (`post_cate_id`),
  CONSTRAINT `post_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `quiz_practice`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz_data` (
  `sentence_id` BIGINT NOT NULL AUTO_INCREMENT,
  `subject_id` BIGINT NOT NULL,
  PRIMARY KEY (`sentence_id`),
  INDEX `sentence_id` (`sentence_id` ASC) VISIBLE,
    CONSTRAINT `quiz_data_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz_answer` (
  `answer_id` BIGINT NOT NULL AUTO_INCREMENT,
  `answer_data` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `sentence_id` BIGINT NULL DEFAULT NULL,
  `is_true_answer` BIT(1) NULL DEFAULT NULL,
  `explanation` VARCHAR(256) NULL DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  INDEX `sentence_id` (`sentence_id` ASC) VISIBLE,
  CONSTRAINT `quiz_answer_ibfk_1`
    FOREIGN KEY (`sentence_id`)
    REFERENCES `quiz_practice`.`quiz_data` (`sentence_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz_question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz_question` (
  `question_id` BIGINT NOT NULL AUTO_INCREMENT,
  `question_data` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `sentence_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  INDEX `sentence_id` (`sentence_id` ASC) VISIBLE,
  CONSTRAINT `quiz_question_ibfk_1`
    FOREIGN KEY (`sentence_id`)
    REFERENCES `quiz_practice`.`quiz_data` (`sentence_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz_type` (
  `quiz_type_id` BIGINT NOT NULL AUTO_INCREMENT,
  `quiz_type_name` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  PRIMARY KEY (`quiz_type_id`),
  INDEX `quiz_type_id` (`quiz_type_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz` (
  `quiz_id` BIGINT NOT NULL AUTO_INCREMENT,
  `quiz_name` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  `description` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `subject_id` BIGINT NULL DEFAULT NULL,
  `lesson_id` BIGINT NULL DEFAULT NULL,
  `quiz_type_id` BIGINT NOT NULL,
  `date_create` DATETIME NULL DEFAULT NULL,
  `duration_time` INT NULL DEFAULT NULL,
  `pass_rate` INT NULL DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `quiz_ibfk_1`
   FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`),
    CONSTRAINT `quiz_ibfk_2`
   FOREIGN KEY (`quiz_type_id`)
    REFERENCES `quiz_practice`.`quiz_type` (`quiz_type_id`),
    CONSTRAINT `quiz_ibfk_3`
   FOREIGN KEY (`lesson_id`)
    REFERENCES `quiz_practice`.`lesson` (`lesson_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz_detail` (
  `quiz_detail_id` BIGINT NOT NULL AUTO_INCREMENT,
  `sentence_id` BIGINT NULL DEFAULT NULL,
   `quiz_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`quiz_detail_id`),
  INDEX `quiz_id` (`quiz_id` ASC) VISIBLE,
  CONSTRAINT `quiz_detail_ibfk_1`
    FOREIGN KEY (`sentence_id`)
    REFERENCES `quiz_practice`.`quiz_data` (`sentence_id`),
    CONSTRAINT `quiz_detail_ibfk_2`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `quiz_practice`.`quiz` (`quiz_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `quiz_practice`.`examlevel
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`exam_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `num_quest` INT,
  `quiz_id` BIGINT,
  PRIMARY KEY (`id`),
  CONSTRAINT `examlevel_ibfk_1`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `quiz_practice`.`quiz` (`quiz_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz_result`
-- -------------------------------------examlevel----------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz_result` (
  `result_id` BIGINT NOT NULL AUTO_INCREMENT,
  `score` INT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  `date_taken` DATETIME NULL DEFAULT NULL,
  `date_end` DATETIME NULL DEFAULT NULL,
  `quiz_id` BIGINT NULL DEFAULT NULL,
  `correct_answer` INT NULL DEFAULT NULL,
  `null_answer` INT NULL DEFAULT NULL,
  `false_answer` INT NULL DEFAULT NULL,
  `is_done` BIT(1) NULL DEFAULT NULL,
  `is_pass` BIT(1) NULL DEFAULT FALSE,
  PRIMARY KEY (`result_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `quiz_id` (`quiz_id` ASC) VISIBLE,
  CONSTRAINT `quiz_result_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `quiz_practice`.`users` (`user_id`),
  CONSTRAINT `quiz_result_ibfk_2`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `quiz_practice`.`quiz` (`quiz_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`quiz_resultdetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`quiz_result_detail` (
  `quiz_exam_detail` BIGINT NOT NULL AUTO_INCREMENT,
  `result_id` BIGINT NULL DEFAULT NULL,
  `user_answer` BIGINT NULL DEFAULT NULL,
  `sentence_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`quiz_exam_detail`),
  INDEX `result_id` (`result_id` ASC) VISIBLE,
  INDEX `user_answer` (`user_answer` ASC) VISIBLE,
  INDEX `sentence_id` (`sentence_id` ASC) VISIBLE,
  CONSTRAINT `quiz_result_detail_ibfk_1`
    FOREIGN KEY (`result_id`)
    REFERENCES `quiz_practice`.`quiz_result` (`result_id`),
  CONSTRAINT `quiz_resultdetail_ibfk_2`
    FOREIGN KEY (`user_answer`)
    REFERENCES `quiz_practice`.`quiz_answer` (`answer_id`),
  CONSTRAINT `quiz_result_detail_ibfk_3`
    FOREIGN KEY (`sentence_id`)
    REFERENCES `quiz_practice`.`quiz_data` (`sentence_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`slider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`sliders` (
  `slider_id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `image` VARCHAR(256) NULL DEFAULT NULL,
  `subject_id` BIGINT NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  `note` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  PRIMARY KEY (`slider_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `slider_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`subject_join`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`subject_join` (
`subject_join_id` BIGINT NOT NULL AUTO_INCREMENT,
  `subject_id` BIGINT NOT NULL ,
  `user_id` BIGINT NOT NULL,
	`is_pass` BIT NULL DEFAULT NULL,
  PRIMARY KEY (`subject_join_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `subject_join_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`),
  CONSTRAINT `subject_join_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `quiz_practice`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`subjectprice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`subject_price` (
  `pre_id` BIGINT NOT NULL AUTO_INCREMENT,
  `price` BIGINT NULL DEFAULT NULL,
  `subject_id` BIGINT NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  PRIMARY KEY (`pre_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `subject_price_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`subjectteacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`subject_teacher` (
`subject_teacher_id` BIGINT NOT NULL AUTO_INCREMENT,
  `subject_id` BIGINT NULL,
  `user_id` BIGINT NULL,
  PRIMARY KEY (`subject_teacher_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `subject_teacher_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`),
  CONSTRAINT `subject_teacher_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `quiz_practice`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



-- -----------------------------------------------------
-- Table `quiz_practice`.`user_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_practice`.`user_payment` (
  `bill_id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NULL DEFAULT NULL,
  `pre_id` BIGINT NULL DEFAULT NULL,
  `status` BIT NULL DEFAULT NULL,
  `notify` VARCHAR(256) CHARACTER SET 'utf8mb4'  NULL DEFAULT NULL,
  `subject_id` BIGINT NULL DEFAULT NULL,
  `purchase_date` DATETIME NOT NULL,
  PRIMARY KEY (`bill_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `pre_id` (`pre_id` ASC) VISIBLE,
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `user_payment_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `quiz_practice`.`users` (`user_id`),
  CONSTRAINT `user_payment_ibfk_2`
    FOREIGN KEY (`pre_id`)
    REFERENCES `quiz_practice`.`subject_price` (`pre_id`),
  CONSTRAINT `user_payment_ibfk_3`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- Create 
CREATE TABLE IF NOT EXISTS `quiz_practice`.`verification_token` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(256) CHARACTER SET 'utf8mb4',
  `expiration_time` DATETIME NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `verification_token_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `quiz_practice`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `quiz_practice`.`wish_list`(
	 `id` BIGINT NOT NULL AUTO_INCREMENT,
      `user_id` BIGINT NULL DEFAULT NULL,
       `subject_id` BIGINT NOT NULL,
       PRIMARY KEY (`id`),
       INDEX `user_id` (`user_id` ASC) VISIBLE,
       CONSTRAINT `wish_list_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `quiz_practice`.`users` (`user_id`),
    CONSTRAINT `wish_list_ibfk_2`
    FOREIGN KEY (`subject_id`)
    REFERENCES `quiz_practice`.`subject` (`subject_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- Index
-- 1. users
-- 2. subject_category
-- 3. subject
-- 4. subject_topic
-- 5. lesson_type
-- 6. lesson
-- 7. post_category
-- 8. post
-- 9. quiz_data
-- 10. quiz_answer
-- 11. quiz_question
-- 12. quiz_type
-- 13. quiz
-- 14. quiz_detail 
-- 15. exam_level
-- 16. quiz_result
-- 17. quiz_result_detail
-- 18. sliders
-- 19. subject_join
-- 20. subject_price
-- 21. subject_teacher
-- 22. user_payment
-- 23. verification_token


-- Insert field

-- 1. Insert to users

INSERT INTO `quiz_practice`.`users`
(`user_id`,
`password`,
`first_name`,
`last_name`,
`email`,
`mobile`,
`gender`,
`create_date`,
`image`,
`is_enabled`,
`role`)
VALUES
(1, "$2a$10$quS2hnY5Fglq29NNtu86OeUelo0hTyRElm3FyGaZZR9b/TCqT0Eg.", "Quang", "Nguyen Vinh", "quanpdhe170415@fpt.edu.vn",0334745645,1,"2003-11-19","",1,"ADMIN"),
(2,"$2a$10$quS2hnY5Fglq29NNtu86OeUelo0hTyRElm3FyGaZZR9b/TCqT0Eg.","Quan","Pham Duc","vquang191103@gmail.com",0334745645,1,"2003-11-19","",1,"MARKETING"),
(3,"$2a$10$quS2hnY5Fglq29NNtu86OeUelo0hTyRElm3FyGaZZR9b/TCqT0Eg.","An","Bui Gia","quangnv1911@gmail.com",0334745645,1,"2003-11-19","",1,"CUSTOMER"),
(4, "$2a$10$quS2hnY5Fglq29NNtu86OeUelo0hTyRElm3FyGaZZR9b/TCqT0Eg.", "An", "Nguyen Thanh", "quangss310@gmail.com", 0334987654, 1, "2003-11-19","", 1, "EXPERT");



-- 2. Insert to subject_category


INSERT INTO `quiz_practice`.`subject_category`
(`cate_id`,`cate_name`)
VALUES
(1, "Development"),
(2, "Business"),
(3, "Finance & Accounting"),
(4,"IT & Software"),
(5,"Office Productivity"),
(6,"Personal Development"),
(7,"Design"),
(8,"Marketing"),
(9,"Lifestyle"),
(10,"Photography & Video"),
(11,"Health & Fitness"),
(12,"Music"),
(13,"Teaching & Academics");



-- 3. Insert to subject
INSERT INTO `quiz_practice`.`subject`
(`subject_id`,
`subject_name`,
`cate_id`,
`status`,
`image`,
`description`,
`create_date`)
VALUES
(1, "Statistics / Data Analysis in SPSS: Inferential Statistics", 1, 1, "https://res.cloudinary.com/dt4zxti7x/image/upload/v1699031077/subject_1_orsxqk.jpg", "Increase Your Data Analytic Skills – Highly Valued And Sought After By Employers", "2020-06-05"),
(2, "FER", 1, 1, "https://res.cloudinary.com/dt4zxti7x/image/upload/v1699031077/subject_1_orsxqk.jpg", "Day la lop hoc FER", "2023-09-29"),
(3, "SWT", 1, 1, "https://res.cloudinary.com/dt4zxti7x/image/upload/v1699031077/subject_1_orsxqk.jpg", "Day la lop hoc FER", "2023-09-28"),
(4, "HTML, JavaScript, & Bootstrap ", 1, 1, "https://res.cloudinary.com/dt4zxti7x/image/upload/v1699031077/subject_1_orsxqk.jpg", "A Comprehensive Guide for Beginners interested in learning HTML, JavaScript, & Bootstrap. Build Interactive Web Pages.", "2023-09-28");

-- 4. Insert to subject_topic

INSERT INTO `quiz_practice`.`subject_topic`
(`topic_id`,
`topic_name`,
`status`,
`subject_topic_order`,
`subject_id`)
VALUES
(1, "HTML Development",true, 1, 4),
(2, "Javascript Development",true, 2, 4),
(3, "Bootstrap Development",true, 3, 4);


-- 5. Insert to lesson_type

INSERT INTO `quiz_practice`.`lesson_type`
(`lesson_type_id`,
`lesson_type_name`)
VALUES
(1, "quiz"),
(2, "video"),
(3, "content");


-- 6. Insert to lesson

INSERT INTO `quiz_practice`.`lesson`
(`lesson_id`,
`lesson_name`,
`status`,
`lesson_order`,
`video_link`,
`topic_id`,
`lesson_type_id`,
`lesson_content`)
VALUES
(1, "Introduect to HTML", true, 1,"salY_Sm6mv4?si=tcrUkJTunS_4oocG", 1, 2, null),
(2, "Practice HTML", true, 2, null,1, 1, null),
(3, "Note about HTML", true, 3, null, 1,3, "Bạn cần hoàn thành bài trên"),
(4, "Introduce to CSS", true, 4,null, 2, 3, "Bạn cần làm bài này"),
(5, "Introduce to Boostrap", true, 5, null,3, 3, "Bạn cần làm bài này"),
(6, "Practice Javascript", true, 6, null, 3, 1, null);



-- 7. Insert to post_category

INSERT INTO `quiz_practice`.`post_category`
(`post_cate_id`,
`post_cate_name`)
VALUES (1, "Development"),
(2, "Business"),
(3, "Finance & Accounting"),
(4,"IT & Software"),
(5,"Office Productivity"),
(6,"Personal Development"),
(7,"Design"),
(8,"Marketing"),
(9,"Lifestyle"),
(10,"Photography & Video"),
(11,"Health & Fitness"),
(12,"Music"),
(13,"Teaching & Academics");


-- 8. Insert to post
-- 9. Insert to quiz_data

INSERT INTO `quiz_practice`.`quiz_data`
(`sentence_id`,
`subject_id`)
VALUES
(1, 4),
(2, 4),
(3, 4);
-- (4, 4),
-- (5, 4),
-- (6, 4),
-- (7, 4),
-- (8, 4),
-- (9, 4),
-- (10, 4),
-- (11, 4),
-- (12, 4);


-- 10. Insert to quiz_answer

INSERT INTO `quiz_practice`.`quiz_answer`
(`answer_id`,
`answer_data`,
`sentence_id`,
`is_true_answer`,
`explanation`)
VALUES
(1 ,"HTML stands for Hyper Text Markup Language", 1, 1, ""),
( 2, "HTML stands for High Text Markup Language", 1, 0, ""),
( 3, "HTML stands for Hyperlinks and Text Markup Language", 1, 0, ""),
( 4, "HTML stands for Home Tool Markup Language", 1, 0, ""),
( 5, "The correct element for the largest heading is <h1>", 2, 1, ""),
( 6, "The correct element for the largest heading is <heading>", 2, 0, ""),
( 7, "The correct element for the largest heading is <h6>", 2, 0, ""),
( 8, "The correct element for the largest heading is <head>", 2, 0, ""),
( 9, "Web network", 3, 0, ""),
( 10, "Web server", 3, 0, ""),
( 11, "Web browser", 3, 1, ""),
( 12, "Web matrix", 3, 0, "");


-- 11. Insert to quiz_question

INSERT INTO `quiz_practice`.`quiz_question`
(`question_id`,
`question_data`,
`sentence_id`)
VALUES
(1, "What does HTML stand for?", 1),
(2, "What is the correct HTML element for the largest heading?", 2),
(3, "Which of the following is used to read an HTML page and render it?",3);



-- 12. Insert to quiz_type

INSERT INTO `quiz_practice`.`quiz_type`
(`quiz_type_id`,
`quiz_type_name`)
VALUES
(1, "LEARNING"),
(2, "PRACTICE"),
(3, "EXAM");


-- 13. Insert to quiz

INSERT INTO `quiz_practice`.`quiz`
(`quiz_id`,
`quiz_name`,
`status`,
`description`,
`subject_id`,
`lesson_id`,
`quiz_type_id`,
`date_create`,
`duration_time`,
`pass_rate`)
VALUES
 (1, "Practice HTML", 1, "", 4, 2, 1, "2023-10-09", 1, 50),
 (2, "Practice Javascript", 1, "", 4, 6, 1, "2023-10-09", 60, 50),
  (3, "Practice Final", 1, "", 4, null, 1, "2023-10-09", 60, 50);


-- 14. Insert to quiz_detail 

INSERT INTO `quiz_practice`.`quiz_detail`
(`quiz_detail_id`,
`sentence_id`,
`quiz_id`)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);
-- (4, 4, 1),
-- (5, 5, 1),
-- (6, 6, 1),
-- (7, 7, 1),
-- (8, 8, 1),
-- (9, 9, 1),
-- (10, 10, 1),
-- (11, 11, 1),
-- (12, 12, 1);


-- 15. Insert to exam_level
-- 16. Insert to quiz_result

-- INSERT INTO `quiz_practice`.`quiz_result`
-- (`result_id`,
-- `score`,
-- `user_id`,
-- `date_taken`,
-- `quiz_id`,
-- `correct_answer`,
-- `null_answer`,
-- `false_answer`,
-- `is_pass`,
-- `is_done`)
-- VALUES
-- (1,77,3,"2023-05-11",1,5,4,8,1, 1),
--  (2, 23,3,"2023-05-11",2,5,4,8,1, 1);
-- (45,4,"2023-05-11",3,6,9,1,1),
-- (20,4,"2023-05-11",4,12,3,5,1),
-- (13,4,"2023-05-11",5,9,1,3,1);


-- 17. Insert to quiz_result_detail



-- 18. Insert to sliders

INSERT INTO `quiz_practice`.`sliders`
(`slider_id`,
`image`,
`title`,
`subject_id`,
`note`,
`status`)
VALUES
(1, "https://res.cloudinary.com/dt4zxti7x/image/upload/v1699031340/html-course-banner_gybzgs.jpg", "Đây là khóa học 1", 1, "Bạn nên học khóa học này 1", 1),
(2, "https://res.cloudinary.com/dt4zxti7x/image/upload/v1699031340/html-course-banner_gybzgs.jpg", "Đây là khóa học 2", 2, "Bạn nên học khóa học này 2", 1);


-- 19. Insert to subject_join


-- 20. Insert to subject_price


INSERT INTO `quiz_practice`.`subject_price`
(`pre_id`,
`price`,
`subject_id`,
`status`)
VALUES
(1, 1000000, 2, 1),
(2, 1000000, 3, 1),
(3, 1000000, 4, 1);


-- 21. Insert to subject_teacher
INSERT INTO `quiz_practice`.`subject_teacher`
(`subject_teacher_id`,
`subject_id`,
`user_id`)
VALUES
(1, 1,4),
(2,4,4);



-- 22. Insert to user_payment

INSERT INTO `quiz_practice`.`user_payment`
(`bill_id`,
`user_id`,
`pre_id`,
`status`,
`notify`,
`subject_id`,
`purchase_date`)
VALUES(1,3,1,0,'Success register',2,'2023-09-28'),
(2,3,2,1,'Success register',2,'2023-09-28'),
(3,3,3,1,'Success register',4,'2023-09-28');


-- 23. Insert to verification_token

