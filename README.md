<div align="center">

![Library](https://img.shields.io/badge/System-brown?style=for-the-badge)
![Assembly](https://img.shields.io/badge/Assembly-x86__64-blue?style=for-the-badge)

*Small standard C helpers written in x86_64 assembly*

</div>

<div align="center">
  <img src="/images/Libasm.jpg">
</div>

# Libasm

[README en Espanol](README_es.md)

`Libasm` is a `42 School` project that reimplements a small subset of libc functions in x86_64 assembly for Linux.

## ✨ Features

- **String functions**: `ft_strlen()`, `ft_strcpy()`, `ft_strcmp()`, `ft_strdup()`
- **Syscall wrappers**: `ft_read()`, `ft_write()`
- **Error handling**: `ft_read()` and `ft_write()` set `errno` on failure

## 📚 Implemented functions

| Function      | Description                                   |
|---------------|-----------------------------------------------|
| `ft_strlen()` | Returns string length                         |
| `ft_strcpy()` | Copies a string to a destination buffer       |
| `ft_strcmp()` | Compares two strings (like `strcmp`)          |
| `ft_strdup()` | Duplicates a string using `malloc`            |
| `ft_read()`   | Reads from a file descriptor (`read` syscall) |
| `ft_write()`  | Writes to a file descriptor (`write` syscall) |

## 🔧 Installation

```bash
git clone git@github.com:Kobayashi82/Libasm.git
cd Libasm
make
```

## 🖥️ Usage

### Integration code
```c
#include <unistd.h>

size_t  ft_strlen(const char *s);
ssize_t ft_write(int fd, const void *buf, size_t count);

int main(void) {
    const char *msg = "Hello from libasm\n";
    ft_write(1, msg, ft_strlen(msg));
    return 0;
}
```

### Compile with the library
```bash
gcc -Wall -Wextra -Werror -o program program.c -Lbuild/lib -lasm
```

## 🧪 Testing

```bash
make
./libasm
```

## 📄 License

This project is licensed under the WTFPL – [Do What the Fuck You Want to Public License](http://www.wtfpl.net/about/).

---

<div align="center">

**💾 Developed as part of the 42 School curriculum 💾**

*"Speaking CPU's native tongue"*

</div>
