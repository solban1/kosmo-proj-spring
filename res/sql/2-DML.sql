insert into MEMBER (email, nickname, pwd, name, ph, age) values ('bhs123@bhs.com', 'admin', '1234', '������', '01000000000', 30);
insert into MEMBER (email, nickname, pwd, name, ph, age) values ('sol@bhs.com', 'sol', '1234', '��ֹ�', '01012341234', 28);
insert into MEMBER (email, nickname, pwd, name, ph, age) values ('hsk@bhs.com', 'hsk', '1234', 'ȫ����', '01003568900', 20);
insert into MEMBER (email, nickname, pwd, name, ph, age) values ('sang@bhs.com', 'sang', '1234', '�����', '01014702580', 25);

insert into diner (name, location, category) values ('ī��', '���ϱ�', '�ε�');
insert into diner (name, location, category) values ('�߻���', '��걸', '�߽�');

insert into board (title, content, writer, diner_seq, parent) values ('���� ������', '����', 'sol@bhs.com', 3, null);
insert into board (title, content, writer, diner_seq, parent) values ('', '����', 'sol@bhs.com', 3, 1);

alter table board drop constraint SYS_C009126;