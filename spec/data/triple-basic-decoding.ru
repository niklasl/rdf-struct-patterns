DELETE {
  ?s ?rel ?t .
  ?t a rdf:TripleForm ;
    rdf:tripleSubject ?ts ; rdf:triplePredicate ?tp ; rdf:tripleObject ?to .
}
INSERT {
  ?s ?rel <<( ?ts ?tp ?to )>> .
}
WHERE {
  ?s ?rel ?t .
  ?t a rdf:TripleForm ;
    rdf:tripleSubject ?ts ; rdf:triplePredicate ?tp ; rdf:tripleObject ?to .
};
# The above nests triple in triple but doesn't remove its basic-encoded form:
DELETE {
  ?s ?p <<( ?ts ?tp ?t_t )>> .
  ?t_t a rdf:TripleForm ;
    rdf:tripleSubject ?t_ts ; rdf:triplePredicate ?t_tp ; rdf:tripleObject ?t_to .
}
# Not needed (taken care of above):
#INSERT {
#  ?s ?p <<( ?ts ?tp <<( ?t_ts ?t_tp ?t_to )>> )>> .
#}
WHERE {
  ?s ?p <<( ?ts ?tp ?t_t )>> .
  ?t_t a rdf:TripleForm ;
    rdf:tripleSubject ?t_ts ; rdf:triplePredicate ?t_tp ; rdf:tripleObject ?t_to .
}
