# NAME

Set::Similarity::Cosine - Cosine similarity for sets

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

# COPYRIGHT AND LICENSE

Copyright (C) 2013-2014 by Helmut Wollmersdorfer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
