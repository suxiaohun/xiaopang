- gcc test1.c -fPIC -shared  -o libtest1.so
- gcc test2.c -fPIC -shared  -o libtest2.so
 

mac

- gcc -dynamiclib -o libtest1.dylib test1.c
- gcc -dynamiclib -o libtest2.dylib test2.c



-

- gcc test1.c -fPIC -shared  -dynamiclib -o libtest1.dylib