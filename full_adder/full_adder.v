module full_adder(a,b,cin,sum,carry);
input a,b,cin;
output sum;
output carry ;
wire w1,w2,w3;
half_adder HA1 (.a(a),.b(b),.sum(w1),.carry(w2));
half_adder HA2 (.a(w1),.b(carry),.sum(sum),.carry(w3));
or or1 (carry,w3,w2);
endmodule
