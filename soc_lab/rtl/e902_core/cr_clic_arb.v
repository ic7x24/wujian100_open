/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_clic_arb(
  arb_ctrl_output_clk_en,
  clic_pad_int_hv,
  clic_pad_int_id,
  clic_pad_int_il,
  clic_pad_int_priv,
  cliccfg_cpuclk,
  cliccfg_data,
  clicth_data,
  clicthcfg_data,
  cpu_clic_curid,
  cpu_clic_int_exit,
  cpurst_b,
  ctrl_arb_int_sec,
  ctrl_arb_prio0_mask,
  ctrl_arb_prio10_mask,
  ctrl_arb_prio11_mask,
  ctrl_arb_prio12_mask,
  ctrl_arb_prio13_mask,
  ctrl_arb_prio14_mask,
  ctrl_arb_prio15_mask,
  ctrl_arb_prio1_mask,
  ctrl_arb_prio2_mask,
  ctrl_arb_prio3_mask,
  ctrl_arb_prio4_mask,
  ctrl_arb_prio5_mask,
  ctrl_arb_prio6_mask,
  ctrl_arb_prio7_mask,
  ctrl_arb_prio8_mask,
  ctrl_arb_prio9_mask,
  ctrl_xx_cliccfg_updt_val,
  ctrl_xx_cliccfg_updt_vld,
  ctrl_xx_clicth_updt_val,
  ctrl_xx_clicth_updt_vld,
  ctrl_xx_clicthcfg_hi_updt_vld,
  ctrl_xx_clicthcfg_lo_updt_vld,
  ctrl_xx_clicthcfg_updt_val,
  ctrl_xx_int_req,
  m_th_clr_clk_en,
  out_clk
);
input           cliccfg_cpuclk;               
input   [9 :0]  cpu_clic_curid;               
input           cpu_clic_int_exit;            
input           cpurst_b;                     
input   [63:0]  ctrl_arb_int_sec;             
input   [63:0]  ctrl_arb_prio0_mask;          
input   [63:0]  ctrl_arb_prio10_mask;         
input   [63:0]  ctrl_arb_prio11_mask;         
input   [63:0]  ctrl_arb_prio12_mask;         
input   [63:0]  ctrl_arb_prio13_mask;         
input   [63:0]  ctrl_arb_prio14_mask;         
input   [63:0]  ctrl_arb_prio15_mask;         
input   [63:0]  ctrl_arb_prio1_mask;          
input   [63:0]  ctrl_arb_prio2_mask;          
input   [63:0]  ctrl_arb_prio3_mask;          
input   [63:0]  ctrl_arb_prio4_mask;          
input   [63:0]  ctrl_arb_prio5_mask;          
input   [63:0]  ctrl_arb_prio6_mask;          
input   [63:0]  ctrl_arb_prio7_mask;          
input   [63:0]  ctrl_arb_prio8_mask;          
input   [63:0]  ctrl_arb_prio9_mask;          
input   [7 :0]  ctrl_xx_cliccfg_updt_val;     
input           ctrl_xx_cliccfg_updt_vld;     
input   [7 :0]  ctrl_xx_clicth_updt_val;      
input           ctrl_xx_clicth_updt_vld;      
input           ctrl_xx_clicthcfg_hi_updt_vld; 
input           ctrl_xx_clicthcfg_lo_updt_vld; 
input   [9 :0]  ctrl_xx_clicthcfg_updt_val;   
input   [63:0]  ctrl_xx_int_req;              
input           out_clk;                      
output          arb_ctrl_output_clk_en;       
output          clic_pad_int_hv;              
output  [9 :0]  clic_pad_int_id;              
output  [7 :0]  clic_pad_int_il;              
output  [1 :0]  clic_pad_int_priv;            
output  [7 :0]  cliccfg_data;                 
output  [7 :0]  clicth_data;                  
output  [9 :0]  clicthcfg_data;               
output          m_th_clr_clk_en;              
reg             clic_pad_int_hv;              
reg     [9 :0]  clic_pad_int_id;              
reg     [7 :0]  clic_pad_int_il;              
reg     [1 :0]  clic_pad_int_priv;            
reg     [9 :0]  int_sel_id;                   
reg             int_vld_flop;                 
reg     [7 :0]  m_th;                         
reg     [9 :0]  m_thcfg;                      
reg     [5 :0]  nlbits;                       
reg     [1 :0]  nmbits;                       
reg             nvbits;                       
reg     [7 :0]  post_8arb_int_levl;           
reg     [63:0]  post_8arb_int_req;            
reg     [7 :0]  sel_out_il;                   
wire            arb_ctrl_output_clk_en;       
wire            cliccfg_cpuclk;               
wire    [7 :0]  cliccfg_data;                 
wire    [7 :0]  clicth_data;                  
wire    [9 :0]  clicthcfg_data;               
wire    [9 :0]  cpu_clic_curid;               
wire            cpu_clic_int_exit;            
wire            cpurst_b;                     
wire    [63:0]  ctrl_arb_prio0_mask;          
wire    [63:0]  ctrl_arb_prio1_mask;          
wire    [63:0]  ctrl_arb_prio2_mask;          
wire    [63:0]  ctrl_arb_prio3_mask;          
wire    [63:0]  ctrl_arb_prio4_mask;          
wire    [63:0]  ctrl_arb_prio5_mask;          
wire    [63:0]  ctrl_arb_prio6_mask;          
wire    [63:0]  ctrl_arb_prio7_mask;          
wire    [7 :0]  ctrl_xx_cliccfg_updt_val;     
wire            ctrl_xx_cliccfg_updt_vld;     
wire    [7 :0]  ctrl_xx_clicth_updt_val;      
wire            ctrl_xx_clicth_updt_vld;      
wire            ctrl_xx_clicthcfg_hi_updt_vld; 
wire            ctrl_xx_clicthcfg_lo_updt_vld; 
wire    [9 :0]  ctrl_xx_clicthcfg_updt_val;   
wire    [63:0]  ctrl_xx_int_req;              
wire            get_int_pri0_req;             
wire            get_int_pri1_req;             
wire            get_int_pri2_req;             
wire            get_int_pri3_req;             
wire            get_int_pri4_req;             
wire            get_int_pri5_req;             
wire            get_int_pri6_req;             
wire            get_int_pri7_req;             
wire    [7 :0]  get_int_prio;                 
wire            int_flop_on;                  
wire    [63:0]  int_prio0_req;                
wire    [63:0]  int_prio1_req;                
wire    [63:0]  int_prio2_req;                
wire    [63:0]  int_prio3_req;                
wire    [63:0]  int_prio4_req;                
wire    [63:0]  int_prio5_req;                
wire    [63:0]  int_prio6_req;                
wire    [63:0]  int_prio7_req;                
wire            int_vld;                      
wire            m_th_clr;                     
wire            m_th_clr_clk_en;              
wire    [1 :0]  mode_mask;                    
wire            op_en;                        
wire            out_clk;                      
wire            pre_clic_pad_int_hv;          
wire    [9 :0]  pre_clic_pad_int_id;          
wire    [7 :0]  pre_clic_pad_int_il;          
wire    [1 :0]  pre_clic_pad_int_priv;        
wire    [7 :0]  sel_arb_int_levl;             
wire            sel_arb_int_nvbit;            
wire    [63:0]  sel_arb_int_req;              
wire            vld_int_vld;                  
parameter CLICINTNUM = 64;
   parameter CLICMASK = 8;
   parameter CLICINTBITS = 3;
   parameter NLMASK      = 3;
  assign int_prio0_req = ctrl_arb_prio0_mask[63:0] & ctrl_xx_int_req[63:0];
  assign int_prio1_req = ctrl_arb_prio1_mask[63:0] & ctrl_xx_int_req[63:0];
  assign int_prio2_req = ctrl_arb_prio2_mask[63:0] & ctrl_xx_int_req[63:0];
  assign int_prio3_req = ctrl_arb_prio3_mask[63:0] & ctrl_xx_int_req[63:0];
  assign int_prio4_req = ctrl_arb_prio4_mask[63:0] & ctrl_xx_int_req[63:0];
  assign int_prio5_req = ctrl_arb_prio5_mask[63:0] & ctrl_xx_int_req[63:0];
  assign int_prio6_req = ctrl_arb_prio6_mask[63:0] & ctrl_xx_int_req[63:0];
  assign int_prio7_req = ctrl_arb_prio7_mask[63:0] & ctrl_xx_int_req[63:0];
assign get_int_pri0_req = (|int_prio0_req[CLICINTNUM-1:0]);
assign get_int_pri1_req = (|int_prio1_req[CLICINTNUM-1:0]);
assign get_int_pri2_req = (|int_prio2_req[CLICINTNUM-1:0]);
assign get_int_pri3_req = (|int_prio3_req[CLICINTNUM-1:0]);
assign get_int_pri4_req = (|int_prio4_req[CLICINTNUM-1:0]);
assign get_int_pri5_req = (|int_prio5_req[CLICINTNUM-1:0]);
assign get_int_pri6_req = (|int_prio6_req[CLICINTNUM-1:0]);
assign get_int_pri7_req = (|int_prio7_req[CLICINTNUM-1:0]);
assign int_vld           = |ctrl_xx_int_req[63:0];
assign get_int_prio[7:0] = {get_int_pri7_req,get_int_pri6_req,get_int_pri5_req,get_int_pri4_req,
                            get_int_pri3_req,get_int_pri2_req,get_int_pri1_req,get_int_pri0_req};
always @( int_prio1_req[63:0]
       or int_prio2_req[63:0]
       or get_int_prio[7:0]
       or int_prio5_req[63:0]
       or int_prio4_req[63:0]
       or int_prio7_req[63:0]
       or int_prio6_req[63:0]
       or int_prio3_req[63:0]
       or int_prio0_req[63:0])
begin
casez(get_int_prio[7:0])
  8'b1???????: post_8arb_int_req[CLICINTNUM-1:0] = int_prio7_req[CLICINTNUM-1:0];  
  8'b01??????: post_8arb_int_req[CLICINTNUM-1:0] = int_prio6_req[CLICINTNUM-1:0];  
  8'b001?????: post_8arb_int_req[CLICINTNUM-1:0] = int_prio5_req[CLICINTNUM-1:0];  
  8'b0001????: post_8arb_int_req[CLICINTNUM-1:0] = int_prio4_req[CLICINTNUM-1:0];  
  8'b00001???: post_8arb_int_req[CLICINTNUM-1:0] = int_prio3_req[CLICINTNUM-1:0];  
  8'b000001??: post_8arb_int_req[CLICINTNUM-1:0] = int_prio2_req[CLICINTNUM-1:0];  
  8'b0000001?: post_8arb_int_req[CLICINTNUM-1:0] = int_prio1_req[CLICINTNUM-1:0];  
  8'b00000001: post_8arb_int_req[CLICINTNUM-1:0] = int_prio0_req[CLICINTNUM-1:0];  
  default    : post_8arb_int_req[CLICINTNUM-1:0] = int_prio0_req[CLICINTNUM-1:0]; 
  endcase
end
always @( get_int_prio[7:0])
begin
casez(get_int_prio[7:0])
  8'b1???????: post_8arb_int_levl[7:0] = {3'b111,5'b11111};  
  8'b01??????: post_8arb_int_levl[7:0] = {3'b110,5'b11111};  
  8'b001?????: post_8arb_int_levl[7:0] = {3'b101,5'b11111};  
  8'b0001????: post_8arb_int_levl[7:0] = {3'b100,5'b11111}; 
  8'b00001???: post_8arb_int_levl[7:0] = {3'b011,5'b11111};  
  8'b000001??: post_8arb_int_levl[7:0] = {3'b010,5'b11111};  
  8'b0000001?: post_8arb_int_levl[7:0] = {3'b001,5'b11111};  
  8'b00000001: post_8arb_int_levl[7:0] = {3'b000,5'b11111}; 
  default:     post_8arb_int_levl[7:0] = {3'b000,5'b11111}; 
  endcase
end
   assign sel_arb_int_req[CLICINTNUM-1:0] = post_8arb_int_req[CLICINTNUM-1:0];
   assign sel_arb_int_levl[7:0]           = post_8arb_int_levl[7:0];
   assign sel_arb_int_nvbit               = post_8arb_int_levl[5];
always @( sel_arb_int_req[63:0])
begin
casez(sel_arb_int_req[63:0])
  64'b1???????????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h3F;
  64'b01??????????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h3E;
  64'b001?????????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h3D;
  64'b0001????????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h3C;
  64'b00001???????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h3B;
  64'b000001??????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h3A;
  64'b0000001?????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h39;
  64'b00000001????????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h38;
  64'b000000001???????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h37;
  64'b0000000001??????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h36;
  64'b00000000001?????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h35;
  64'b000000000001????????????????????????????????????????????????????:int_sel_id[9:0] =  10'h34;
  64'b0000000000001???????????????????????????????????????????????????:int_sel_id[9:0] =  10'h33;
  64'b00000000000001??????????????????????????????????????????????????:int_sel_id[9:0] =  10'h32;
  64'b000000000000001?????????????????????????????????????????????????:int_sel_id[9:0] =  10'h31;
  64'b0000000000000001????????????????????????????????????????????????:int_sel_id[9:0] =  10'h30;
  64'b00000000000000001???????????????????????????????????????????????:int_sel_id[9:0] =  10'h2F;
  64'b000000000000000001??????????????????????????????????????????????:int_sel_id[9:0] =  10'h2E;
  64'b0000000000000000001?????????????????????????????????????????????:int_sel_id[9:0] =  10'h2D;
  64'b00000000000000000001????????????????????????????????????????????:int_sel_id[9:0] =  10'h2C;
  64'b000000000000000000001???????????????????????????????????????????:int_sel_id[9:0] =  10'h2B;
  64'b0000000000000000000001??????????????????????????????????????????:int_sel_id[9:0] =  10'h2A;
  64'b00000000000000000000001?????????????????????????????????????????:int_sel_id[9:0] =  10'h29;
  64'b000000000000000000000001????????????????????????????????????????:int_sel_id[9:0] =  10'h28;
  64'b0000000000000000000000001???????????????????????????????????????:int_sel_id[9:0] =  10'h27;
  64'b00000000000000000000000001??????????????????????????????????????:int_sel_id[9:0] =  10'h26;
  64'b000000000000000000000000001?????????????????????????????????????:int_sel_id[9:0] =  10'h25;
  64'b0000000000000000000000000001????????????????????????????????????:int_sel_id[9:0] =  10'h24;
  64'b00000000000000000000000000001???????????????????????????????????:int_sel_id[9:0] =  10'h23;
  64'b000000000000000000000000000001??????????????????????????????????:int_sel_id[9:0] =  10'h22;
  64'b0000000000000000000000000000001?????????????????????????????????:int_sel_id[9:0] =  10'h21;
  64'b00000000000000000000000000000001????????????????????????????????:int_sel_id[9:0] =  10'h20;
  64'b000000000000000000000000000000001???????????????????????????????:int_sel_id[9:0] =  10'h1F;
  64'b0000000000000000000000000000000001??????????????????????????????:int_sel_id[9:0] =  10'h1E;
  64'b00000000000000000000000000000000001?????????????????????????????:int_sel_id[9:0] =  10'h1D;
  64'b000000000000000000000000000000000001????????????????????????????:int_sel_id[9:0] =  10'h1C;
  64'b0000000000000000000000000000000000001???????????????????????????:int_sel_id[9:0] =  10'h1B;
  64'b00000000000000000000000000000000000001??????????????????????????:int_sel_id[9:0] =  10'h1A;
  64'b000000000000000000000000000000000000001?????????????????????????:int_sel_id[9:0] =  10'h19;
  64'b0000000000000000000000000000000000000001????????????????????????:int_sel_id[9:0] =  10'h18;
  64'b00000000000000000000000000000000000000001???????????????????????:int_sel_id[9:0] =  10'h17;
  64'b000000000000000000000000000000000000000001??????????????????????:int_sel_id[9:0] =  10'h16;
  64'b0000000000000000000000000000000000000000001?????????????????????:int_sel_id[9:0] =  10'h15;
  64'b00000000000000000000000000000000000000000001????????????????????:int_sel_id[9:0] =  10'h14;
  64'b000000000000000000000000000000000000000000001???????????????????:int_sel_id[9:0] =  10'h13;
  64'b0000000000000000000000000000000000000000000001??????????????????:int_sel_id[9:0] =  10'h12;
  64'b00000000000000000000000000000000000000000000001?????????????????:int_sel_id[9:0] =  10'h11;
  64'b000000000000000000000000000000000000000000000001????????????????:int_sel_id[9:0] =  10'h10;
  64'b0000000000000000000000000000000000000000000000001???????????????:int_sel_id[9:0] =  10'h0F;
  64'b00000000000000000000000000000000000000000000000001??????????????:int_sel_id[9:0] =  10'h0E;
  64'b000000000000000000000000000000000000000000000000001?????????????:int_sel_id[9:0] =  10'h0D;
  64'b0000000000000000000000000000000000000000000000000001????????????:int_sel_id[9:0] =  10'h0C;
  64'b00000000000000000000000000000000000000000000000000001???????????:int_sel_id[9:0] =  10'h0B;
  64'b000000000000000000000000000000000000000000000000000001??????????:int_sel_id[9:0] =  10'h0A;
  64'b0000000000000000000000000000000000000000000000000000001?????????:int_sel_id[9:0] =  10'h09;
  64'b00000000000000000000000000000000000000000000000000000001????????:int_sel_id[9:0] =  10'h08;
  64'b000000000000000000000000000000000000000000000000000000001???????:int_sel_id[9:0] =  10'h07;
  64'b0000000000000000000000000000000000000000000000000000000001??????:int_sel_id[9:0] =  10'h06;
  64'b00000000000000000000000000000000000000000000000000000000001?????:int_sel_id[9:0] =  10'h05;
  64'b000000000000000000000000000000000000000000000000000000000001????:int_sel_id[9:0] =  10'h04;
  64'b0000000000000000000000000000000000000000000000000000000000001???:int_sel_id[9:0] =  10'h03;
  64'b00000000000000000000000000000000000000000000000000000000000001??:int_sel_id[9:0] =  10'h02;
  64'b000000000000000000000000000000000000000000000000000000000000001?:int_sel_id[9:0] =  10'h01;
  64'b0000000000000000000000000000000000000000000000000000000000000001:int_sel_id[9:0] =  10'h00;
  default: int_sel_id[9:0] = 10'bx;
endcase
end
always@(posedge cliccfg_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    nmbits[1:0] <= {2{1'b0}};
    nlbits[3:0] <= {4{1'b0}};
    nlbits[5:4] <= {2{1'b0}}; 
    nvbits <= {1{1'b0}};
  end
  else if(ctrl_xx_cliccfg_updt_vld && op_en)begin
    nmbits[1:0] <= ctrl_xx_cliccfg_updt_val[6:5] & mode_mask[1:0];
    nlbits[3:0] <= ctrl_xx_cliccfg_updt_val[4:1] & NLMASK;
    nlbits[5:4] <= {2{1'b0}}; 
    nvbits      <= ctrl_xx_cliccfg_updt_val[0];
  end
end
always@(posedge cliccfg_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    m_th[7:0] <= 8'b0;
  else if(ctrl_xx_clicth_updt_vld)
    m_th[7:0] <= ctrl_xx_clicth_updt_val[7:0];
  else if(m_th_clr)
    m_th[7:0] <= 8'b0;
end
assign clicth_data[7:0] = m_th[7:0];
always@(posedge cliccfg_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    m_thcfg[7:0] <= 8'b0;
  else if(ctrl_xx_clicthcfg_lo_updt_vld)
    m_thcfg[7:0] <= ctrl_xx_clicthcfg_updt_val[7:0];
end
always@(posedge cliccfg_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    m_thcfg[9:8] <= 2'b0;
  else if(ctrl_xx_clicthcfg_hi_updt_vld)
    m_thcfg[9:8] <= ctrl_xx_clicthcfg_updt_val[9:8];
end
assign m_th_clr  = (cpu_clic_int_exit && (cpu_clic_curid[9:0] == m_thcfg[9:0]));
assign clicthcfg_data[9:0] = m_thcfg[9:0];
assign m_th_clr_clk_en  = m_th_clr;
assign op_en = 1'b1;
  assign mode_mask[1:0] = 2'b00;
  assign pre_clic_pad_int_priv[1:0] = 2'b11;
  assign pre_clic_pad_int_il[7:0] = {8{|sel_arb_int_req[CLICINTNUM-1:0]}} & sel_out_il[7:0];
always@(*)
begin
  case(nlbits[3:0])
  4'd0: sel_out_il[7:0] = 8'hff;
  4'd1: sel_out_il[7:0] = {sel_arb_int_levl[7],7'h7f};
  4'd2: sel_out_il[7:0] = {sel_arb_int_levl[7:6],6'h3f};
  4'd3: sel_out_il[7:0] = {sel_arb_int_levl[7:5],5'h1f};
  default:sel_out_il[7:0] = {sel_arb_int_levl[7:5],5'h1f};
  endcase
end
assign cliccfg_data[7:0] =  {8{op_en}} & {1'b0,nmbits[1:0],nlbits[3:0],nvbits};
assign pre_clic_pad_int_hv = nvbits ? sel_arb_int_nvbit : 1'b0;
assign pre_clic_pad_int_id[9:0] = int_sel_id[9:0];
always @(posedge out_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    int_vld_flop <=1'b0;
  else
    int_vld_flop <=  int_vld && vld_int_vld;
end
assign int_flop_on  = int_vld_flop || int_vld && vld_int_vld;
assign vld_int_vld  = (pre_clic_pad_int_priv[1:0] == 2'b11) && (pre_clic_pad_int_il[7:0] > m_th[7:0]);
always @(posedge out_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    clic_pad_int_priv[1:0]   <= 2'b00;
    clic_pad_int_il[7:0]     <= 8'b0;
    clic_pad_int_id[9:0]     <= 10'b0;
    clic_pad_int_hv          <= 1'b0;
  end
  else if(int_flop_on)
  begin
    clic_pad_int_priv[1:0]   <= pre_clic_pad_int_priv[1:0];
    clic_pad_int_il[7:0]     <= pre_clic_pad_int_il[7:0]; 
    clic_pad_int_id[9:0]     <= pre_clic_pad_int_id[9:0];
    clic_pad_int_hv          <= pre_clic_pad_int_hv;    
  end
end
assign arb_ctrl_output_clk_en  = int_flop_on;
endmodule
