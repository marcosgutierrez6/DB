# Autenticación y creación de roles MongoDB

# Índice

1. [Habilitar la Autenticación en MongoDB](#1-habilitar-la-autenticación-en-mongodb)
   - [a) Iniciar el servidor usando la opción `--auth`](#a-iniciar-el-servidor-usando-la-opción--auth)
2. [Creación de la Primera Instancia y Usuario Administrador](#2-creación-de-la-primera-instancia-y-usuario-administrador)
3. [Reiniciar MongoDB con Autenticación](#4-reiniciar-mongodb-con-autenticación)
4. [Creación de Roles y Usuarios Específicos](#5-creación-de-roles-y-usuarios-específicos)
   - [Usuario con rol personalizado](#usuario-con-rol-personalizado)


## 1. Habilitar la Autenticación en MongoDB

Por defecto, MongoDB arranca sin autenticación. Para activarla, se puede:

### a) Iniciar el servidor usando la opción `--auth` despues de crear un usuario:

```bash
mongod --auth

# mongod.conf
security:
  authorization: "enabled"

```

## 2. Creación de la Primera Instancia y Usuario Administrador

```bash
use admin
db.createUser({
  user: "admin",
  pwd: "tu_contraseña_segura",
  roles: [
    { role: "userAdminAnyDatabase", db: "admin" },
    "readWriteAnyDatabase"
  ]
})

```

## 4. Reiniciar MongoDB con Autenticación

```bash
mongod --auth

mongo --port 27017 -u "admin" -p "tu_contraseña_segura" --authenticationDatabase "admin"
```

## 4. Creación de Roles y Usuarios Específicos
```bash
use admin
db.createRole({
  role: "lectorEscritor",
  privileges: [
    { resource: { db: "miBaseDatos", collection: "" }, actions: [ "find", "insert", "update", "remove" ] }
  ],
  roles: []
})
```

### Usuario con rol personalizado
```bash
use miBaseDatos
db.createUser({
  user: "usuario1",
  pwd: "contraseña_usuario1",
  roles: [
    { role: "lectorEscritor", db: "admin" }
  ]
})
```
