# NAME

Set::Similarity::CosinePP - Cosine similarity for sets pure Perl vector implementation

<div>
    <a href="https://travis-ci.org/wollmers/Set-Similarity-CosinePP"><img src="https://travis-ci.org/wollmers/Set-Similarity-CosinePP.png" alt="Set-Similarity-CosinePP"></a>
    <a href='https://coveralls.io/r/wollmers/Set-Similarity-CosinePP?branch=master'><img src='https://coveralls.io/repos/wollmers/Set-Similarity-CosinePP/badge.png?branch=master' alt='Coverage Status' /></a>
    <a href='http://cpants.cpanauthors.org/dist/Set-Similarity-CosinePP'><img src='http://cpants.cpanauthors.org/dist/Set-Similarity-CosinePP.png' alt='Kwalitee Score' /></a>
    <a href="http://badge.fury.io/pl/Set-Similarity-CosinePP"><img src="https://badge.fury.io/pl/Set-Similarity-CosinePP.svg" alt="CPAN version" height="18"></a>
</div>

# SYNOPSIS

    use Set::Similarity::CosinePP;
    
    # object method
    my $cosine = Set::Similarity::CosinePP->new;
    my $similarity = $cosine->similarity('Photographer','Fotograf');
    

# DESCRIPTION

## Cosine similarity

A intersection B / (sqrt(A) \* sqrt(B))

# METHODS

[Set::Similarity::CosinePP](https://metacpan.org/pod/Set::Similarity::CosinePP) inherits all methods from [Set::Similarity](https://metacpan.org/pod/Set::Similarity) and implements the
following new ones.

## from\_sets

     my $similarity = $object->from_sets(['a'],['b']);
    

This method expects two arrayrefs of strings as parameters. The parameters are not checked, thus can lead to funny results or uncatched divisions by zero.

If you want to use this method directly, you should take care that the elements are unique. Also you should catch the situation where one of the arrayrefs is empty (similarity is 0), or both are empty (similarity is 1).

# SOURCE REPOSITORY

[http://github.com/wollmers/Set-Similarity-CosinePP](http://github.com/wollmers/Set-Similarity-CosinePP)

# AUTHOR

Helmut Wollmersdorfer, <helmut.wollmersdorfer@gmail.com>

<div>
    <a href='http://cpants.cpanauthors.org/author/wollmers'><img src='http://cpants.cpanauthors.org/author/wollmers.png' alt='Kwalitee Score' /></a>
</div>

# COPYRIGHT AND LICENSE

Copyright (C) 2013-2014 by Helmut Wollmersdorfer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
