**Currently Not Working**

Mindreader is currently not working even if 10 algorithms are inductively written for each mind read person per day.  It does not necessarily require the computer to simulate meditation.  Mindreader produces vague mind reading results, that remind you of your thoughts but are not actually your thoughts.

# Mindreader

Contains Prolog programs that can be used by an individual to project spiritual images and read their mind using meditation.

# Getting Started

Please read the following instructions on how to install the project on your computer for writing code.

# Prerequisites

Install List Prolog Interpreter Repository (https://github.com/luciangreen/listprologinterpreter).

Install Text to Breasonings Repository (https://github.com/luciangreen/Text-to-Breasonings).

# Installation from List Prolog Package Manager (LPPM)

* Optionally, you can install from LPPM by installing <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine, downloading the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>, loading LPPM with `['lppm'].` then installing the package by running `lppm_install("luciangreen","mindreader").`.

# Installing and Preparation

Download Lucian Green's List Prolog Interpreter Repository and this repository.

**Caution**

- Before running texttobr-based mind reader, think of two radio buttons put on recordings, put through with prayer, nut and bolt, quantum box prayer 1, 1, 0.5 cm and 1, 1, 0.5 cm.

- Follow instructions in https://github.com/luciangreen/listprologinterpreter/blob/master/Instructions_for_Using_texttobr(2).pl.txt when using texttobr, texttobr2 or mind reader to avoid medical problems.

Please follow instructions in init.txt to initialise any new mind-reading algorithms.

See instructions on running below

 **Important:** Eliminate interference once you have got the algorithm working with 4*4000 breasonings for it working: `['../Text-to-Breasonings/texttobr2qb.pl']`.  `texttobr2(64)`. and eliminating any instances of interference with 250 breasonings: `texttobr2(2).` (2) for dotting on and doing it.

Additional instructions for preparing to run screen projector:
Breason out songs used to help project pixels.
In Shell:
`cd Text-to-Breasonings`
In swipl:
```
[meditationnoreplace].
['texttobrall2.pl'].
['texttobr'].
texttobr2(u,"file-songs.txt",u,u,false,false,false,false,false,false).
texttobr(u,"file-songs.txt",u,u,false,false,false,false,false,false).

```
In Shell:
`cd ../mindreader`
In swipl:
```
['postsong'].
postsong(10).  %% For ten songs
```
Write a spiritual letter to your federal government (with a done up A per sentence) to activate the technology.
In Shell:
`cd ../Text-to-Breasonings`
In swipl:

```
texttobr2(u,"letter.txt",u,u,false,false,false,false,false,false).
texttobr2(u,"file-letter.txt",u,u,false,false,false,false,false,false).
```

Running
Recognise you thinking of objects
In Shell:
`cd ../mindreader`
In swipl:

```
['mindreadtestobj-12scrn-2'].
sectest(1).
```
Replace 1 with the number of times to repeat algorithm.

Recognise you thinking of more objects
```
['mindreadtestobj-12scrn-2medit'].
sectest(1).
```
Replace 1 with the number of times to repeat algorithm.

Recognise you thinking of characters
```
['mindreadtestobj-12scrn-2chars'].
sectest(1).
```
Replace 1 with the number of times to repeat algorithm.

* If necessary, repeat the "arem" mantra all the time while the mind reading computation is running to ensure the best results.

# Versioning

We will use SemVer for versioning.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details

