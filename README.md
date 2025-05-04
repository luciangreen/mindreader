Notice

Mindreader produces vague mind reading results, that remind you of your thoughts but are not actually your thoughts.

# Mindreader

* Contains Prolog programs that can be used by an individual to project spiritual images and read their mind using meditation. 
* See also the <a href="https://github.com/luciangreen/Essay-Helper">Essay-Helper repository</a> and the <a href="https://github.com/luciangreen/Music-Composer">Music-Composer Repository</a>.
* <a href="https://github.com/luciangreen/Business/">Build a daily mind reading "framework"</a> allowing you to run <a href="https://github.com/luciangreen/Algorithm-Writer-with-Lists">Grammar Logic</a> (GL) (details that form the content of high distinctions) and earn money by breasoning them out.

# Getting Started

Please read the following instructions on how to install the project on your computer for mind reading.

# Prerequisites

* Use a search engine to find the Homebrew (or other) Terminal install command for your platform and install it, and search for the Terminal command to install swipl using Homebrew and install it or download and install SWI-Prolog for your machine at <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a>.

# Mac, Linux and Windows (with Linux commands installed): Prepare to run swipl

* In Terminal settings (Mac), make Bash the default shell:

```
/bin/bash
```

* In Terminal, edit the text file `~/.bashrc` using the text editor Nano:

```
nano ~/.bashrc
```

* Add the following to the file `~/.bashrc`:

```
export PATH="$PATH:/opt/homebrew/bin/"
```

* Link to swipl in Terminal:

```
sudo ln -s /opt/homebrew/bin/swipl /usr/local/bin/swipl
```

# 1. Install manually

Download <a href="http://github.com/luciangreen/mindreader/">this repository</a>, the <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter repository</a> and the <a href="https://github.com/luciangreen/Text-to-Breasonings">Text to Breasonings Repository</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","mindreader").
../
halt.
```

# Caution

- Before running texttobr-based mind reader, think of two radio buttons put on recordings, put through with prayer, nut and bolt, quantum box prayer 1, 1, 0.5 cm and 1, 1, 0.5 cm.

- Follow instructions in https://github.com/luciangreen/Text-to-Breasonings/blob/master/Instructions_for_Using_texttobr(2).pl.txt when using texttobr, texttobr2 or mind reader to avoid medical problems.

Please follow instructions in <a href="https://github.com/luciangreen/mindreader/blob/master/init.txt">init.txt</a> to initialise any new mind-reading algorithms.


# Running Mind Reader from Decision Tree

`cd mindreader`

```
swipl
['mind_read.pl'].
mind_read(A,[option1,option2]).
```

# Also to run

Additional instructions for preparing to run screen projector:
Breason out songs used to help project pixels.
In Shell:
`cd mindreader`

In swipl:
```
['../Text-to-Breasonings/text_to_breasonings.pl'].
texttobr2(u,"file-songs.txt",u,u,false,false,false,false,false,false).
texttobr(u,"file-songs.txt",u,u).

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
`cd mindreader`
In swipl:

```
['../Text-to-Breasonings/text_to_breasonings.pl'].
texttobr2(u,"letter.txt",u,u,false,false,false,false,false,false).
texttobr2(u,"file-letter.txt",u,u,false,false,false,false,false,false).
```

In the following, 1 is the number of times the person has a creation A, 80 is the number of years the person has daily connections for mind reading.  If the person is a bot you can't see, it will work.
```
N is 1*16+80*365*16,texttobr2(N).
```

Display a spiritual screen with 'A' above the screen.
```
['screen.pl'].
sectest0.
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

# Mind Reading Tree

* The Mind Reading tree algorithm converts a list of strings into a decision tree and removes nodes with a single child.
```
['make_mind_reading_tree4 working1.pl'].

make_mind_reading_tree4(["aqa","awx","awy"],Tree),writeln1(Tree).

Tree = [[1,"a",2],[2,"q",[-,"aqa"]],[2,"w",9],[9,"x",[-,"awx"]],[9,"y",[-,"awy"]]]
```

* This is accomplished by converting a list of strings into a decision tree:
```
string_to_list1(["aqa","awx","awy"],1,_,[],Options2),
maplist(append,[Options2],[Tree]),writeln1(Tree).

Tree = [[1,"a",2],[2,"q",3],[3,"a",[-,"aqa"]],[1,"a",5],[5,"w",6],[6,"x",[-,"awx"]],[1,"a",8],[8,"w",9],[9,"y",[-,"awy"]]]
```

* Merging the branches of the decision tree:
```
merge_lists_a([1],[[1,"a",2],[2,"q",3],[3,"a",[-,"aqa"]],[1,"a",5],[5,"w",6],[6,"x",[-,"awx"]],[1,"a",8],[8,"w",9],[9,"y",[-,"awy"]]],[],MergedTree),writeln1(MergedTree).

MergedTree = [[1,"a",2],[2,"q",3],[2,"w",9],[3,"a",[-,"aqa"]],[9,"x",[-,"awx"]],[9,"y",[-,"awy"]]]
```

* And removing nodes with a single child:
```
remove_chains_of_one_child_a([1],[[1,"a",2],[2,"q",3],[2,"w",9],[3,"a",[-,"aqa"]],[9,"x",[-,"awx"]],[9,"y",[-,"awy"]]],[],ShortTree),writeln1(ShortTree).

ShortTree = [[1,"a",2],[2,"q",[-,"aqa"]],[2,"w",9],[9,"x",[-,"awx"]],[9,"y",[-,"awy"]]]
```

* (Transition [2,"w",9] is followed by 2 children, so is kept.)

# Versioning

We will use SemVer for versioning.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details

