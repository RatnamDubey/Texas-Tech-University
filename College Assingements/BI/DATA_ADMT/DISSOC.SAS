%let values=;
%let in=;
%let out=;


proc sql;
  create table v56767c as
    select distinct &_targets from &in;

  create table r57304x as
    select distinct &_id as &_id,  a.&_targets, '~'||a.&_targets as notvalue
    from &in, v56767c as a;

  create table &out as
    select b.&_id, coalesce(a.&_targets, b.notvalue) as &_targets
    from &in as a right join r57304x as b
    on a.&_id=b.&_id and
         a.&_targets=b.&_targets
    where a.&_targets ~= '' or b.&_targets in (&values);

quit;

proc datasets library=work nolist;
  delete r57304x v56767c;
quit;
