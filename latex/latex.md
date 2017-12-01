### LaTex:

Let's start by installing Latex. [Here](http://www.latex-project.org/get/)!


For _Debian_ distros, we can install:
```
$ sudo apt-get install texlive
```

Once you write the _latex_ file you can:
    
    - `latex file.tex`: which will ouput _file.dvi_, which you can read it with `xdvi file.dvi`.
    - `pdflatex file.text`: which will output _file.pdf_.


In the .vimrc, we can add:
```
autocmd FileType tex map <F5>:w pdflatex %<CR>
```

> Didn't work for me!

[Here](http://www.maths.tcd.ie/~dwilkins/LaTeXPrimer/) we can find _Getting Started_ tutorial.
Also [here](https://www.sharelatex.com/learn/Creating_a_document_in_LaTeX).



#### Intro:

Functions are called:
```
\documenclass{article}
```

> If the function does not have parameters, we can ommit the `{}`.


* documentclass: specifies the text _format_.
    - article
    - book
    - handout
    - ...


The text will be between:
```
\begin{document}


This is some text!


\end{document}
```


Using `evince` to read the pdf file, which will automatically update whenever the pdf file is changed.


#### Title:

You can specify title:
```
\author{Oussema Hidri}
\title{My First {\LaTeX} Document}
\date{Something}
```

Between the opening and closing tags:
```
\maketitle
```

2 things to notice:

    - _Predifined_ LaTeX syntax.
    - _date_ function can take anything but can also be omitted.



To make paragraph you must make __2 returns__.


#### Section Heading:

The number of sections will be automatically assigned when it's compiled.

```
\secton{Section Name}
```


#### Sub-Section:

```
\subsection{Sub Section Name}
```


> When you write the document, you just writhe skeleton, the way it looks will be changed later.



#### Bold Text:

```
\textbf{This is bold text!}
```


#### Italic Text:

```
\textit{This is italic text!}
```


#### Emphatic Text:

```
\emph{This is emphatic}
```


> By default emphatic and italic text are the same, but you can change the look of the _former_ one and keep the _later_ as it is.


#### Underline Text:

```
\underline{This is Underline}
```

#### Quotation Text:

```
``This is a text in quotattion''
`Single also'
```




#### Second part:


* Ordered List:
```
\begin{enumerate}
\item item1
\item item2
\item item3
\item item4
\end{enumerate}
```

* Unordered List:
```
\begin{itemize}
\item item1
\item item2
\item item3
\item item4
\end{itemize}
```


> If you want a sub-list, you just need to use the same syntax for a list.


* To use labels, you need to call the following wherever you want:
```
\label{list}
```

Eg.
```
\section{Lists\label{list}}
```

To call the label you use:
```
\ref{list}
```


> Weirdely, you have you to compile it twice to get rid of the `??`.
> Read [this](https://tex.stackexchange.com/questions/111280/understanding-how-references-and-labels-work).



#### Bibliographies:

You can define a bibliography file where you can add information about resources.

Eg.
```
@book{tag,
    author = "LastName, FirstName",
    title = "My First Book!",
    year = "2017",
    publisher = "Publisher"
}
```

> You can also specify `author = "FirstName LastName"`


> Install __biber__.


Before the __begin__ tag we add:
```
\usepackage[backend=biber]{biblatex}
\addbibresource{pathto.bib}
```

Now to call them you need:
```
\printbibliography
```

This will not output anything, we need to add the `\textcite{}` command:
```
As \textcite{tagName} says, ...
```

> Install `etoolbox` in your machine.

If we compile this, nothing will happen!
We need to run `$ biber filename`.  
The filename shouldn't take any file extension.  
After that we recompile it to get the wanted result.


We can change the format of the bibliography by changing this:
```
\usepackage[backend=biber, style=authoryear-icomp]{biblatex}
```


> You can also use `\parencite{tagName}`.


#### Images:

To be able to use images in you latex documents you need:
```
\usepackage{graphicx}
```

And to use an image:
```
\includegraphics{pathtoimage.png}
```

By default, it will be inserted with the original size.

You can set the width and let the height automatically adjust (you can also add the height)
```
\includegraphics[width=5in]{pathtoimage.png}
```

With Height and _keepaspectratio_:
```
\includegraphics[width=5in,height=6in,keepaspectratio]{pathtoimage.png}
```

The last command will make sure that the image is not stretched.

You can use:
    - scale=0.5 // to scale it.
    - width=\textwidth // make sure to fit it as text size.
    - width=0.7\textwidth // resize upon the textwidth
    - angle=33 // change the angle of the image

You can center it by surrounding it in:
```
\begin{center}
\end{center}
```

> Use package __blindtext__ and call \blndtext to fill your document with text.


#### Figures:

You use figures the same way you use images except that you need to surround them in:
```
\begin{figure}
\end{figure}
```
This will automatically enumerate the figure.

Now after you call the image, you can add a caption:
```
\caption{This is a caption}
```

By default, LaTeX will try to set the figures in the best suited places.  
To override this behavior, you need to:
```
\begin{figure}[h]
```

You can change the parameter to:
    - t: to set the figure at the top of the page
    - b: to set the figure at the bottom of the page
    - p: to set the figure at a separate page.




To wrap up text around figures, we need to use:
```
\usepackage{wrapfig}
```

To use it, we need to surround the image with:
```
\begin{wrapfigure}
\end{wrapfigure}
```

You can add some parameters to it:
```
\begin{wrapfigure}{r}{3in}
\centering
\includegraphics[width=2.5in]{pathtoimage.png}
\caption{Another Caption\label{lastpic}}
\end{wrapfigure}
```

- __r__ for setting the image at the right, and __3in__ for setting the width of the text.

> the `\centering` will add a space between the figure and the text.


With figures, you can use the label and ref commands!




#### Input vs Include:

- `\input{filename}` imports the commands from filename.tex into the target file.  
Equivalent to typing all the commands in the line of the command.

- `\include{filename}` does a `\clearpage` before and after `\input{filename}`.


#### pagestyle:


`\pagestyle{option}`: Changes the style from the current page on throughout the remainder of the document.

Options:

- plain: Just a plain page number.
- empty: empty heads and feet - no page numbers.
- headings: Puts running headings on each page. Document style specifies what goes in the headings.
- myheadings: Specify what is to go in the heading with the `\markboth` or `\markright` commands.



#### setpace:

`\usepackage{setspace}`: support for setting the spacing between lines in a document.

- `\onehalfspacing` - Preferred one.
- `\doublespacing`.



`\phantom{}`: empty box with the same vertical and horizontal size as the __argument__.



#### tocloft:

This package provides the control over the typography of the Table of Contents, List of Figures and List of Tables, and the ability to create new 'List of ...'.


#### fancyhdr:

Facilities for constructing headers and footers and for controlling their use.
