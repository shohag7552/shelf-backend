A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

This sample code handles HTTP GET requests to `/` and `/echo/<message>`


## Step 1
 * just create a dart project for setup [shelf] backend. Which is use for create server response system. 
 * Then I integrate [shelf route]. which is use for generate route {http://localhost.8080/user} .

## Step 2
 * Setup {mysql1} for using mysql database. 
 * Use {dotenv} for setup the database location, port, name, password etc.

## Step 3
 * Use {orm} for database queries or curd operation.
   * Need to add {prisma/schema.prisma} file, which contains -
     - db (database type- mysql, postgresql, sqlite, mongodb)
     - clint (Specifies that the Dart client will be generated)
   * You can  add model there.
   * After setup these, need to run {npx prisma generate} for generating client and models.
   ```
    npx prisma generate
   ``` 
   * after generate you can migrate {npx prisma migrate dev} then database will updated with new table.
    ```
   npx prisma migrate dev
   ```


## ================== **** ===================

# Examples of Prisma commands

Create a migration from changes in Prisma schema, apply it to the database, trigger generators (e.g. Prisma Client)
$ prisma migrate dev

Reset your database and apply all migrations
$ prisma migrate reset

Apply pending migrations to the database in production/staging
$ prisma migrate deploy

Check the status of migrations in the production/staging database
$ prisma migrate status

## ================== **** ===================



# Running the sample

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

You should see the logging printed in the first terminal:
```
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```

For adding prisma cli
