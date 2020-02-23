/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module tim6_sec_top(
  etb_tim1_trig_en_off,
  etb_tim1_trig_en_on,
  etb_tim2_trig_en_off,
  etb_tim2_trig_en_on,
  intr,
  paddr,
  pclk,
  penable,
  pprot,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  scan_mode,
  tim1_etb_trig,
  tim2_etb_trig,
  tipc_tim6_trust
);
input           etb_tim1_trig_en_off; 
input           etb_tim1_trig_en_on; 
input           etb_tim2_trig_en_off; 
input           etb_tim2_trig_en_on; 
input   [31:0]  paddr;               
input           pclk;                
input           penable;             
input   [2 :0]  pprot;               
input           presetn;             
input           psel;                
input   [31:0]  pwdata;              
input           pwrite;              
input           scan_mode;           
input           tipc_tim6_trust;     
output  [1 :0]  intr;                
output  [31:0]  prdata;              
output          tim1_etb_trig;       
output          tim2_etb_trig;       
wire            etb_tim1_trig_en_off; 
wire            etb_tim1_trig_en_on; 
wire            etb_tim2_trig_en_off; 
wire            etb_tim2_trig_en_on; 
wire    [31:0]  i_prdata;            
wire            i_psel;              
wire            i_pwrite;            
wire    [1 :0]  intr;                
wire    [31:0]  paddr;               
wire            pclk;                
wire            penable;             
wire    [2 :0]  pprot;               
wire    [31:0]  prdata;              
wire            presetn;             
wire            psel;                
wire    [31:0]  pwdata;              
wire            pwrite;              
wire            scan_mode;           
wire            tim1_etb_trig;       
wire            tim2_etb_trig;       
wire            tipc_tim6_trust;     
tim6_tim_top  x_tim6_tim_top (
  .etb_tim1_trig_en_off (etb_tim1_trig_en_off),
  .etb_tim1_trig_en_on  (etb_tim1_trig_en_on ),
  .etb_tim2_trig_en_off (etb_tim2_trig_en_off),
  .etb_tim2_trig_en_on  (etb_tim2_trig_en_on ),
  .intr                 (intr                ),
  .paddr                (paddr               ),
  .pclk                 (pclk                ),
  .penable              (penable             ),
  .prdata               (i_prdata            ),
  .presetn              (presetn             ),
  .psel                 (i_psel              ),
  .pwdata               (pwdata              ),
  .pwrite               (i_pwrite            ),
  .scan_mode            (scan_mode           ),
  .tim1_etb_trig        (tim1_etb_trig       ),
  .tim2_etb_trig        (tim2_etb_trig       )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite = pwrite;
assign i_psel = psel;

endmodule
