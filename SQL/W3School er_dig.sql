-- Er diggram for  w3Schoool'

create database w3school;
use w3school;

-- strong entites
create table user (user_id int  primary key auto_increment,
first_name varchar(255),
last_name  varchar(255),
email varchar(255) unique,
password_hash varchar(255),
role enum("teacher", "students", "admin"),
status enum("active","inactive","suspended"),
profile_picture_url mediumblob,
bio text,
created_at  timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
lats_loging_at timestamp default current_timestamp,
email_verifeid boolean ,
paid_user boolean,
dob date);

create table course( course_id int primary key  auto_increment,
title  varchar(255),
duration varchar(255),
description text,
price decimal(9,2),
slug varchar(255),
difficulty_level varchar(255),
is_published  varchar(255),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp);

create table Tutorial (tutorial_id int  primary key,
 title varchar(255),
slug varchar(255),
category varchar(255),
created_at timestamp default current_timestamp);

create table  Reference ( reference_id int primary key auto_increment,
title varchar(255),
slug varchar(255)UNIQUE,
category varchar(255),
technology varchar(255),
short_description text,
is_published varchar(255),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp);

-- weak entities
create table Sections ( course_id int , --  fk
section_id  int primary key,
title varchar(255),
description text,
display_order varchar(255),
created_at timestamp default current_timestamp ,
constraint Fk_sections_coourse foreign key sections(course_id) 
references course(course_id)on delete cascade on update cascade );

create table pages (             -- (lesson) --> Actual content
section_id int, page_id int ,
primary key (section_id , page_id ),
title varchar(255),
html_content varchar(255),
display_order varchar (255),
reading_time time,
created_at timestamp default current_timestamp,
update_at timestamp default current_timestamp,
is_free boolean  ,
constraint Fk_pages_section  foreign key pages(section_id) references Sections(section_id)
on delete cascade on update cascade);

ALTER TABLE pages
ADD INDEX idx_page_id (page_id);

create table code_example( 
page_id int, example_id int, section_id int,
language_type varchar(255),
code_snippet varchar(255),
excpected_output varchar(255),
explanation text,
is_runnable boolean,
primary key (section_id, page_id , example_id),
constraint FK_code_exp_pages foreign key code_example(section_id,page_id) 
references pages(section_id,page_id)
on delete cascade on update cascade);
 
create table quiz( 
section_id int,
page_id int,
example_id int, 
quiz_id int,
primary key ( section_id, page_id, example_id, quiz_id),
 title varchar(255),
description text,
passing_score int,
max_attempts int,
time_limit  varchar(255),
created_at timestamp default current_timestamp,
constraint Fk_quiz_example foreign key quiz(section_id, page_id, example_id) 
references code_example(section_id, page_id, example_id)
on delete cascade on update cascade);

ALTER TABLE quiz
ADD INDEX idx_quiz_id (quiz_id);


create table questions (
quiz_id int, question_id int,
section_id int,
page_id int,
example_id int,
question_text varchar(255),
question_type enum("mcq","multi-select","true-false"),
diffuclty enum("easy","medium","hard"),
marks int,
primary key (section_id, page_id, example_id, quiz_id, question_id),
constraint Fk_questions_quiz foreign key questions(section_id, page_id, example_id, quiz_id)
references quiz(section_id, page_id, example_id, quiz_id)
on delete cascade on update cascade);

ALTER TABLE questions
ADD INDEX idx_question_id (question_id);

create table questions_options(
    option_id int auto_increment primary key,
    question_id int,

    option_text varchar(255),
    is_correct boolean,

    foreign key (question_id)
        references questions(question_id)
        on delete cascade
        on update cascade
);


-- assciate table

create table user_progress(
user_id int,
course_id int,
progress_percent varchar(255),
last_accessed_page varchar(255),
started_at timestamp default current_timestamp,
completed_at timestamp default current_timestamp,
 constraint fk_user_progreess_user foreign key (user_id) references
 user(user_id) on delete cascade on update cascade,
 
 constraint Fk_user_pro_course foreign key (course_id)references
 course(course_id)on delete cascade on update cascade);

create table  quize_attempt( quiz_id int , -- fk
user_id int , -- fk
attempt_no int ,
score int,
attempt_date date,
time_taken time,
constraint Fk_quize_att_quize foreign key quize_attempt (quiz_id) references 
quiz(quiz_id)on update cascade on delete cascade,
constraint Fk_quizw_att_user foreign key quize_attempt (user_id) references
user(user_id) on update cascade on delete cascade);

create table reviews (review_id int auto_increment primary key,
user_id  int , -- fk
course_id  int , -- fk
review_comment varchar(255),
review_rating int,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
constraint Fk_reviews_user foreign key reviews(user_id)references
user(user_id) on delete cascade on update cascade,
constraint Fk_reviews_course foreign key reviews(course_id) references
course(course_id)on delete cascade on update cascade);

create table Page_progress(
    user_id int,
    page_id int,
    completed boolean,
    completed_at timestamp default current_timestamp,

    constraint Fk_page_progress_user
        foreign key (user_id)
        references user(user_id)
        on delete cascade
        on update cascade,

    constraint Fk_page_progress_page
        foreign key (page_id)
        references pages(page_id)   -- ✅ correct table name
        on delete cascade
        on update cascade
);

create table Certificates ( --   depends on user and course
user_id int ,-- fk
course_id int, -- fk
certificate_id int,
certificate_code int,
issued_date date,
score int,
expiry_date date,
verification_ur varchar(255),
constraint Fk_certificats_user foreign key reviews(user_id)references
user(user_id) on delete cascade on update cascade,
constraint Fk_certificats_course foreign key reviews(course_id) references
course(course_id)on delete cascade on update cascade);


