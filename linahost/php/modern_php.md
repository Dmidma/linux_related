## The New PHP

PHP is an interpreted server-side scripting language. 
It is typically used with a web server, and execute it with an interpreter.  
It can also be used to build powerful command-line applications.


== Side Note ==

> Most mature programming languages have a specification.
> A specification is a canonical blueprint that defines what it means to be PHP.
> The blueprint is used by developers who create programs that parse, interpret, and execute PHP code.

#### Engine

A PHP engine is a program that parses, interprets, and executes PHP code.  
This is note to be confused with PHP, which is a generic reference to the PHP language.

The original PHP engine is the `Zend Engine`, a PHP interpreter writen in C and introduced in PHP 4.
The second major PHP engine `HipHop Virtual Machine` from Facebook.

== Side Note ==

> _Dynamic types_ are checked at runtime, whereas _static types_ are checked at compile time.


### Namespaces

Namespaces are an important tool that organizes PHP code into a virtual hierarchy, comparable to your operating system's filesystem directory structure.

A namespace or subnamespace encapsulates and organizes related PHP classes, just as a filesystem directory contains related files.


* [symfony/httpfoundation](https://github.com/symfony/HttpFoundation) is a popular PHP component that manages HTTP requests and responses.


* PHP namespace declaration always appears on a new line immediately after the opnening `<?php` tag.
* The vendor namespace is the topmost namespace:
```
namespace Symphony\Component\HttpFoundation;
```
* `Symfony` is the vendor namespace.
* `Component` and `HttpFoundation` are subnamespaces.

== Side Note ==

> Subnamespaces are separated with a \ character.


Most PHP components map subnamespaces to filesystem directories for compatibility with the popular PSR-4 autoloader standard.

== Side Note ==

> Technically speaking, namespaces are merely a PHP language notation referenced by the PHP interpreter to apply a common name prefix to a set of classes, interfaces, functions, and constants.


#### Why We Use Namespaces

Namespaces are important because they let us create sandboxed code that works alongside other developer's code.

Without namespaces




### Sanitize Input:

When you sanitize input, you escape or remove unsafe characters.
