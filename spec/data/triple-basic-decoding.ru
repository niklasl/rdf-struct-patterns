PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

DELETE {
  ?s ?rel ?ppn .
  ?ppn a rdf:PropositionForm ;
    rdf:propositionFormSubject ?ppn_s ;
    rdf:propositionFormPredicate ?ppn_p ;
    rdf:propositionFormObject ?ppn_o .
}
INSERT {
  ?s ?rel <<( ?ppn_s ?ppn_p ?ppn_o )>> .
}
WHERE {
  ?s ?rel ?ppn .
  ?ppn a rdf:PropositionForm ;
    rdf:propositionFormSubject ?ppn_s ;
    rdf:propositionFormPredicate ?ppn_p ;
    rdf:propositionFormObject ?ppn_o .
};
# The above nests triple in triple but doesn't remove its basic-encoded form; this does:
DELETE {
  ?s ?p <<( ?ppn_s ?ppn_p ?ppn_ppn )>> .
  ?ppn_ppn a rdf:PropositionForm ;
    rdf:propositionFormSubject ?ppn_ppn_s ;
    rdf:propositionFormPredicate ?ppn_ppn_p ;
    rdf:propositionFormObject ?ppn_ppn_o .
}
# Not needed (taken care of above):
#INSERT {
#  ?s ?p <<( ?ppn_s ?ppn_p <<( ?ppn_ppn_s ?ppn_ppn_p ?ppn_ppn_o )>> )>> .
#}
WHERE {
  ?s ?p <<( ?ppn_s ?ppn_p ?ppn_ppn )>> .
  ?ppn_ppn a rdf:PropositionForm ;
    rdf:propositionFormSubject ?ppn_ppn_s ;
    rdf:propositionFormPredicate ?ppn_ppn_p ;
    rdf:propositionFormObject ?ppn_ppn_o .
}
