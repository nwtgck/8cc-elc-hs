// (from: https://github.com/yutopp/8cc.rill/blob/95eb927561cde2ec72197b0da7bbaf7689e1efa9/examples/hello.c)
int putchar(int c);
void print_str(const char* p);
int puts(const char* p);

int main() {
    puts("hello Haskell world!");
    return 0;
}

void print_str(const char* p) {
  for (; *p; p++)
    putchar(*p);
}

int puts(const char* p) {
    print_str(p);
    putchar('\n');
}
