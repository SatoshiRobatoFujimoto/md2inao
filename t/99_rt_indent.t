use utf8;
use Test::Base;
use Text::Md2Inao::TestHelper;

plan tests => 1 * blocks;
run_is in => 'expected';

__END__
=== case 1
--- in md2inao
Hello
World
--- expected
HelloWorld

=== case 2
--- in md2inao
Hello

World
--- expected
Hello
World

=== case 3
--- in md2inao
Hello


World
--- expected
Hello
World

=== case 4
--- in md2inao
 Hello, World
--- expected
Hello, World

=== case 5
--- in md2inao
  Hello, World
--- expected
Hello, World

=== case 6
--- in md2inao
   Hello, World
--- expected
Hello, World

=== case 7
--- in md2inao
    This is a code block, not indentation.
--- expected
◆list/◆
This is a code block, not indentation.
◆/list◆

=== case 8
--- in md2inao
    use strict;
    use warnings;

    print "Hello, world";
--- expected
◆list/◆
use strict;
use warnings;

print "Hello, world";
◆/list◆

=== case 9
--- in md2inao
  blah blah

    use strict;
    use warnings;

    print "Hello, world";

  blah blah
--- expected
blah blah
◆list/◆
use strict;
use warnings;

print "Hello, world";
◆/list◆
blah blah

=== case 10
--- in md2inao
　blah blah
--- expected
　blah blah

=== case 11
--- in md2id
```
0
 1
  2
   3
    4
```
--- expected
<SJIS-MAC>
<ParaStyle:半行アキ>
<ParaStyle:リスト>0
<ParaStyle:リスト> 1
<ParaStyle:リスト>  2
<ParaStyle:リスト>   3
<ParaStyle:リスト>    4

=== case 12
--- in md2id
0

 1

  2

   3

    4
--- expected
<SJIS-MAC>
<ParaStyle:本文>0
<ParaStyle:本文>1
<ParaStyle:本文>2
<ParaStyle:本文>3
<ParaStyle:半行アキ>
<ParaStyle:リスト>4
