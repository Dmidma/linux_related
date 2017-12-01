#### Resume With LaTeX:

This notes are related to making a resume with LaTeX.


Let's start by making a basic document.


A resume will typically have sections and sub-sections and sub-sub-sections:
```
\section{Technical Skills}

\subsection{Work Flow}

tmux, vim, rsync, git.

\subsection{Languages}

\subsubsection{Programming} 

C, C++, JavaScript, Java.

\subsubsection{Markup}

{\LaTeX}, HTML, CSS 

\subsubsection{Scripting} 

Python, Shell

\section{General Skills}

\section{Education}

\section{Job Experience}
```


Now you can feed LaTeX a structure and make it feel the content in it.

```
\usepackage{titlesec}

\titleformat{\section}
{\huge\bfseries}
{}
{0em}
{}[\titlerule]
```

* The __titleformat__ command is responsible for changing the behavior for the given command.  
It takes 4 parameters:
    1. Formatting
        - `\huge` for big font 
        - `\bfseries` for bold
        - `\lowercase` for lower cases
        - `\Large` for larger cases with Upper case at the start.
        - `\filcenter` for o centric title.
    2. Numbering 
        - `\thesection` to prepend the number of section. (Omit it to deactivate it)
        - `$\bullet$` to prepend bullets.
        - `\hspace{.1in}` or `\vspace{.1in}` for horizontal and vertical space. (You can give it negative values).
    3. Distance between _Numbering_ and afterward.
    4. Text between the _Numbering_ and the section's title.


> You only need to fill __2.__ to allow LaTeX to compile.

> The order of __formatting__ is important!

Appending `[runin]` to the `\titleformat` command, will make the text in one line.
Appending `[frame]` to the `\titleformat` command, will make the text in a frame.

> See documentation for more optional parameters.

> `[\titlerule]` to add a ruler under the titles.


In addition to `titleformat` we have `titlespacing` which control the spacing of a title:
```
\titlespacing{\subsubsection}
{0em}{0em}{0em}
```
    - Left Margin
    - Space Between the subsections
    - Space between the text of the subsection and what comes after it.

> It's not the same for all section, you need to experiment between the values.
> Eg. For the last parameter it will increase vertical margin space for the _subsection_.


##### Titles:

We can use the package `titling` to modify the titles:
```
\renewcommand{\maketitle}{
\begin{center}
{\huge\bfseries
\theauthor}

\vspace{.25em}

d.oussema.d@gmail.com --- http://reddit.com
\end{center}
}
```

- theauthor - The author command.


##### More Space:

We use for that the `geometry` package.

We can change the margin of the whole page:
```
\usepackage[margin=1in]{geometry}
```


