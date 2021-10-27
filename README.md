Notice

* Mind Reader and Text-to-Breasonings are not compatible with the future simulation.

# Mindreader

# Getting Started

Please read the following instructions on how to install the project on your computer for mind reading.

# Prerequisites

* Please download and install SWI-Prolog for your machine at `https://www.swi-prolog.org/build/`.

# 1. Install manually

Download <a href="http://github.com/luciangreen/mindreader/">this repository</a>, the <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter repository</a> and the <a href="https://github.com/luciangreen/Text-to-Breasonings">Text to Breasonings Repository</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","mindreader").
halt
```

# Running

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

