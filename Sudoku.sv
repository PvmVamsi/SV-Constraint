class suduko;
  rand int a[][];
  
  constraint size {a.size() == 9; foreach(a[i]) a[i].size() == 9;}
  constraint range {foreach(a[i,j]) a[i][j] inside{[1:9]};}
  constraint row { foreach(a[i]) unique{a[i]};}
  constraint col {foreach(a[i,j]) unique{a[0][j],a[1][j],a[2][j],a[3][j],a[4][j],a[5][j],a[6][j],a[7][j],a[8][j]};}
  
  constraint box {foreach(a[i,j]) if((i ==0 & (j== 0 || j == 3 || j==6))
                                      || (i ==3 & (j== 0 || j == 3 || j==6))||(i ==6 & (j== 0 || j == 3 || j==6)) )
    
    unique{a[i][j],a[i][j+1],a[i][j+2], a[i+1][j],a[i+1][j+1],a[i+1][j+2], a[i+2][j],a[i+2][j+1],a[i+2][j+2]};}
endclass

module test;
  suduko s;
  initial begin
    s = new();
    repeat(2) begin
    assert(s.randomize());
    
    foreach(s.a[i,j]) begin
      $write("%0d ",s.a[i][j]);

      if(j==8)
        $display("\n");
    end
      $display("===========================");
    end
  end
endmodule
