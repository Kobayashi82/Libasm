<div align="center">

![System & Kernel](https://img.shields.io/badge/System-brown?style=for-the-badge)
![Assembly](https://img.shields.io/badge/Assembly-x86__64-blue?style=for-the-badge)
![Syscalls](https://img.shields.io/badge/Syscalls-read%2Fwrite-green?style=for-the-badge)
![Library](https://img.shields.io/badge/Library-static-red?style=for-the-badge)

*Pequenas utilidades de C estandar escritas en ensamblador x86_64*

</div>

<div align="center">
  <img src="/images/Libasm.jpg">
</div>

# Libasm

[README in English](README.md)

`Libasm` es un proyecto de la `escuela 42` que reimplementa un pequeno subconjunto de funciones de libc en ensamblador x86_64 para Linux.

## ✨ Caracteristicas

- **Funciones de string**: `ft_strlen()`, `ft_strcpy()`, `ft_strcmp()`, `ft_strdup()`
- **Wrappers de syscalls**: `ft_read()`, `ft_write()`
- **Manejo de errores**: `ft_read()` y `ft_write()` ajustan `errno` en fallo

## 📚 Funciones implementadas

| Funcion       | Descripcion                                           |
|---------------|-------------------------------------------------------|
| `ft_strlen()` | Devuelve la longitud de una string                    |
| `ft_strcpy()` | Copia una string a un buffer destino                  |
| `ft_strcmp()` | Compara dos strings (como `strcmp`)                   |
| `ft_strdup()` | Duplica una string usando `malloc`                    |
| `ft_read()`   | Lee desde un descriptor de archivo (syscall `read`)   |
| `ft_write()`  | Escribe en un descriptor de archivo (syscall `write`) |

## 🔧 Instalación

```bash
git clone git@github.com:Kobayashi82/Libasm.git
cd Libasm
make
```

## 🖥️ Uso

### Integracion en codigo
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

### Compilar con la libreria
```bash
gcc -Wall -Wextra -Werror -o program program.c -Lbuild/lib -lasm
```

## 🧪 Testing

```bash
make
./libasm
```

## 📄 Licencia

Este proyecto esta licenciado bajo la WTFPL – [Do What the Fuck You Want to Public License](http://www.wtfpl.net/about/).

---

<div align="center">

**💾 Desarrollado como parte del curriculum de 42 School 💾**

*"Speaking CPU's native tongue"*

</div>
