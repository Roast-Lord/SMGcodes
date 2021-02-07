  // Computation of residues
  // 4 . 5
  // Numerator and denominator coefficients
  // are passed in decreasing powers of z ( say )
 
//[res pol q]=respol(flip(coeff(Hz(2))),flip(coeff(Hz(3)))) 
function [ res , pol , q ] = respol ( num , den )
  len = length ( num ) ;
  if num ( len ) == 0
    num = num (1: len -1) ;
  end

  [ resi ,q ] = pfe ( num , den ) ;
  res = resi (: ,2) ;
  res = int ( res ) + ( clean ( res - int ( res ) ,1.d -04) ) ;
  pol = resi (: ,1) ;
  pol = int ( pol ) + ( clean ( pol - int ( pol ) ,1.d -04) ) ;
endfunction ;
