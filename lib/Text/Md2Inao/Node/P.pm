package Text::Md2Inao::Node::P;
use utf8;
use strict;
use warnings;

use parent 'Text::Md2Inao::Node';

sub to_inao {
    my $self = shift;
    my $p = $self->context->parse_element($self->element);
    if ($p !~ /^[\s　]+$/) {
        return "$p\n";
    }
}

1;
