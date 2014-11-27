"""
ugly methods to
add redirect lines
so that jekyll_redirect_from can redirect the posts
from /yyyy/mm/title/
to /yyyy/mm/title.md
you have to do this in _posts !!!
"""

def read_file_names_in_dir(my_dir):
    from os import listdir
    from os.path import isfile, join
    onlyfiles = [ f for f in listdir(my_dir) if isfile(join(my_dir,f)) ]
    return onlyfiles

def parse_title(text):
    b=text[11:]
    c=b.split('.')
    c.pop()
    c='.'.join(c)
    a=[text[0:4],text[5:7],c]
    return a

def insert_text_in_ith_line(my_file_name,text,line_num=2):
    f=open(my_file_name,'r')
    contents=f.readlines()
    f.close()
    contents.insert(line_num,text)
    f=open(my_file_name,'w')
    contents="".join(contents)
    f.write(contents)
    f.close()
    return True

def add_redirect_lines(my_file_name, line_num=2):
    a=parse_title(my_file_name)
    insert_text_in_ith_line(my_file_name,
        "redirect_from:\n  /"+a[0]+"/"+a[1]+"/"+a[2]+"/\n")
    return True

def add_redirect_lines_in_dir(my_dir):
    a=read_file_names_in_dir(my_dir)
    for item in a:
        add_redirect_lines(item)
    return True
