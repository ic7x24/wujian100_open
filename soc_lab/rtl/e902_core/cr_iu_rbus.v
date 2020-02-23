/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module cr_iu_rbus(
  alu_rbus_data,
  alu_rbus_data_vld,
  alu_rbus_req,
  branch_rbus_data,
  branch_rbus_data_vld,
  branch_rbus_req,
  cp0_iu_data,
  cp0_iu_data_vld,
  cp0_iu_expt_vec,
  cp0_iu_expt_vld,
  cp0_iu_flush,
  cp0_iu_req,
  ctrl_alu_ex_data_sel,
  ctrl_branch_ex_data_sel,
  ctrl_cp0_ex_data_sel,
  ctrl_lsu_ex_data_sel,
  ctrl_mad_ex_data_sel,
  ctrl_special_ex_data_sel,
  ctrl_xx_sp_adjust,
  decd_xx_unit_special_sel,
  hs_split_iu_hs_retire_mask,
  ifu_iu_ex_int_spcu_mask,
  ifu_iu_ex_rd_reg,
  lsu_iu_data,
  lsu_iu_data_vld,
  lsu_iu_expt_vec,
  lsu_iu_expt_vld,
  lsu_iu_fast_retire,
  lsu_iu_req,
  lsu_iu_store,
  mad_alu_data_vld,
  mad_ctrl_stall,
  mad_rbus_req,
  rbus_retire_cmplt,
  rbus_retire_expt_vec,
  rbus_retire_expt_vld,
  rbus_retire_flush,
  rbus_retire_split_inst,
  rbus_wb_cmplt,
  rbus_wb_data,
  rbus_wb_dst_reg,
  rbus_wb_inst_cmplt,
  rbus_wb_load,
  rbus_wb_store,
  special_rbus_expt_vec,
  special_rbus_expt_vld,
  special_rbus_flush,
  special_rbus_req,
  wb_rbus_lsu_vec,
  wb_rbus_st_aft_load,
  wb_xx_acc_err_after_retire
);
input   [31:0]  alu_rbus_data;                   
input           alu_rbus_data_vld;               
input           alu_rbus_req;                    
input   [31:0]  branch_rbus_data;                
input           branch_rbus_data_vld;            
input           branch_rbus_req;                 
input   [31:0]  cp0_iu_data;                     
input           cp0_iu_data_vld;                 
input   [4 :0]  cp0_iu_expt_vec;                 
input           cp0_iu_expt_vld;                 
input           cp0_iu_flush;                    
input           cp0_iu_req;                      
input           ctrl_alu_ex_data_sel;            
input           ctrl_branch_ex_data_sel;         
input           ctrl_cp0_ex_data_sel;            
input           ctrl_lsu_ex_data_sel;            
input           ctrl_mad_ex_data_sel;            
input           ctrl_special_ex_data_sel;        
input           ctrl_xx_sp_adjust;               
input           decd_xx_unit_special_sel;        
input           hs_split_iu_hs_retire_mask;      
input           ifu_iu_ex_int_spcu_mask;         
input   [4 :0]  ifu_iu_ex_rd_reg;                
input   [31:0]  lsu_iu_data;                     
input           lsu_iu_data_vld;                 
input   [4 :0]  lsu_iu_expt_vec;                 
input           lsu_iu_expt_vld;                 
input           lsu_iu_fast_retire;              
input           lsu_iu_req;                      
input           lsu_iu_store;                    
input           mad_alu_data_vld;                
input           mad_ctrl_stall;                  
input           mad_rbus_req;                    
input   [4 :0]  special_rbus_expt_vec;           
input           special_rbus_expt_vld;           
input           special_rbus_flush;              
input           special_rbus_req;                
input   [4 :0]  wb_rbus_lsu_vec;                 
input           wb_rbus_st_aft_load;             
input           wb_xx_acc_err_after_retire;      
output          rbus_retire_cmplt;               
output  [4 :0]  rbus_retire_expt_vec;            
output          rbus_retire_expt_vld;            
output          rbus_retire_flush;               
output          rbus_retire_split_inst;          
output          rbus_wb_cmplt;                   
output  [31:0]  rbus_wb_data;                    
output  [4 :0]  rbus_wb_dst_reg;                 
output          rbus_wb_inst_cmplt;              
output          rbus_wb_load;                    
output          rbus_wb_store;                   
wire            alu_data_sel;                    
wire    [31:0]  alu_rbus_data;                   
wire            alu_rbus_data_vld;               
wire            alu_rbus_req;                    
wire            alu_sel;                         
wire            bctm_rbus_flush;                 
wire            bctm_rbus_req;                   
wire    [31:0]  bctm_rbus_wb_data;               
wire    [4 :0]  bctm_rbus_wb_reg;                
wire            bctm_rbus_wb_vld;                
wire    [31:0]  branch_rbus_data;                
wire            branch_rbus_data_vld;            
wire            branch_rbus_req;                 
wire            branch_sel;                      
wire    [31:0]  cp0_iu_data;                     
wire            cp0_iu_data_vld;                 
wire    [4 :0]  cp0_iu_expt_vec;                 
wire            cp0_iu_expt_vld;                 
wire            cp0_iu_flush;                    
wire            cp0_iu_req;                      
wire            cp0_sel;                         
wire            ctrl_alu_ex_data_sel;            
wire            ctrl_branch_ex_data_sel;         
wire            ctrl_cp0_ex_data_sel;            
wire            ctrl_lsu_ex_data_sel;            
wire            ctrl_mad_ex_data_sel;            
wire            ctrl_special_ex_data_sel;        
wire            ctrl_xx_sp_adjust;               
wire            decd_xx_unit_special_sel;        
wire            hs_split_iu_hs_retire_mask;      
wire            ifu_iu_ex_int_spcu_mask;         
wire    [4 :0]  ifu_iu_ex_rd_reg;                
wire    [31:0]  lsu_iu_data;                     
wire            lsu_iu_data_vld;                 
wire    [4 :0]  lsu_iu_expt_vec;                 
wire            lsu_iu_expt_vld;                 
wire            lsu_iu_fast_retire;              
wire            lsu_iu_flush;                    
wire            lsu_iu_req;                      
wire            lsu_iu_store;                    
wire            lsu_sel;                         
wire            mad_alu_data_vld;                
wire    [31:0]  mad_alu_rbus_data;               
wire            mad_ctrl_stall;                  
wire            mad_data_sel;                    
wire            mad_rbus_req;                    
wire            mad_sel;                         
wire            prgsign_rbus_req;                
wire            prgsign_rbus_secure_violation;   
wire            rbus_cmplt;                      
wire    [31:0]  rbus_data;                       
wire    [31:0]  rbus_data_expt_lsu;              
wire    [31:0]  rbus_data_expt_lsu_without_pol;  
wire            rbus_data_sel_alu;               
wire            rbus_data_sel_branch;            
wire            rbus_data_sel_cp0;               
wire            rbus_data_sel_lsu;               
wire            rbus_data_sel_mad;               
wire            rbus_retire_cmplt;               
wire            rbus_retire_data_vld;            
wire    [4 :0]  rbus_retire_expt_vec;            
wire    [4 :0]  rbus_retire_expt_vec_aft_prgsign; 
wire    [4 :0]  rbus_retire_expt_vec_pre;        
wire            rbus_retire_expt_vld;            
wire            rbus_retire_expt_vld_pre;        
wire            rbus_retire_flush;               
wire            rbus_retire_split_inst;          
wire            rbus_wb_cmplt;                   
wire    [31:0]  rbus_wb_data;                    
wire    [4 :0]  rbus_wb_dst_reg;                 
wire            rbus_wb_inst_cmplt;              
wire            rbus_wb_load;                    
wire            rbus_wb_store;                   
wire            rbus_write_back_cmplt;           
wire    [4 :0]  special_rbus_expt_vec;           
wire            special_rbus_expt_vld;           
wire            special_rbus_flush;              
wire            special_rbus_req;                
wire            special_sel;                     
wire    [4 :0]  wb_rbus_lsu_vec;                 
wire            wb_rbus_st_aft_load;             
wire            wb_xx_acc_err_after_retire;      
assign bctm_rbus_req           = 1'b0;
assign bctm_rbus_flush         = 1'b0;
assign bctm_rbus_wb_vld        = 1'b0;
assign bctm_rbus_wb_data[31:0] = 32'b0;
assign bctm_rbus_wb_reg[4:0]   = 5'b0;
assign lsu_iu_flush            = 1'b0;
assign branch_sel  = ctrl_branch_ex_data_sel;
assign cp0_sel     = ctrl_cp0_ex_data_sel     && !decd_xx_unit_special_sel;
assign special_sel = ctrl_special_ex_data_sel ||  decd_xx_unit_special_sel;
assign lsu_sel     = ctrl_lsu_ex_data_sel     && !decd_xx_unit_special_sel;
assign alu_sel     = (ctrl_alu_ex_data_sel || ctrl_mad_ex_data_sel) && !decd_xx_unit_special_sel;
assign alu_data_sel=  ctrl_alu_ex_data_sel || ctrl_mad_ex_data_sel;
assign mad_sel     = ctrl_mad_ex_data_sel;
assign mad_data_sel= 1'b0;
assign mad_alu_rbus_data[31:0] = 32'b0;
assign prgsign_rbus_req = 1'b0;
assign prgsign_rbus_secure_violation = 1'b0;
assign rbus_cmplt = alu_rbus_req    || mad_rbus_req 
                 || lsu_iu_req      || special_rbus_req
                 || cp0_iu_req      || branch_rbus_req 
                 || bctm_rbus_req   || prgsign_rbus_req; 
assign rbus_retire_cmplt = rbus_cmplt && !hs_split_iu_hs_retire_mask
                                      && !ifu_iu_ex_int_spcu_mask;
assign rbus_retire_flush = 
                           cp0_iu_req      && cp0_iu_flush
                        || bctm_rbus_req   && bctm_rbus_flush
                        || special_rbus_req && special_rbus_flush
                        || lsu_iu_req      && lsu_iu_flush;
assign rbus_data_sel_branch = ctrl_branch_ex_data_sel 
                           && branch_rbus_data_vld    && !bctm_rbus_wb_vld;
assign rbus_data_sel_cp0    = ctrl_cp0_ex_data_sel    && !bctm_rbus_wb_vld;
assign rbus_data_sel_mad    = mad_data_sel            && !bctm_rbus_wb_vld;
assign rbus_data_sel_alu    = alu_data_sel            && !bctm_rbus_wb_vld;
assign rbus_data_expt_lsu_without_pol[31:0] = 
                                  {32{bctm_rbus_wb_vld}}     & bctm_rbus_wb_data[31:0]
                                | {32{rbus_data_sel_branch}} & branch_rbus_data[31:0]
                                | {32{rbus_data_sel_cp0}}    & cp0_iu_data[31:0]
                                | {32{rbus_data_sel_mad}}    & mad_alu_rbus_data[31:0]
                                | {32{rbus_data_sel_alu}}    & alu_rbus_data[31:0];
assign rbus_data[31:0] = {32{!rbus_data_sel_lsu}} & rbus_data_expt_lsu[31:0]
                       | {32{rbus_data_sel_lsu}}  & lsu_iu_data[31:0];
assign rbus_data_expt_lsu[31:0] = rbus_data_expt_lsu_without_pol[31:0];
assign rbus_data_sel_lsu = (ctrl_lsu_ex_data_sel || wb_rbus_st_aft_load)
                           && !bctm_rbus_wb_vld && !ctrl_xx_sp_adjust;
assign rbus_retire_data_vld = alu_sel    && alu_rbus_data_vld
                           || mad_sel    && mad_alu_data_vld
                           || lsu_sel    && lsu_iu_data_vld
                           || cp0_sel    && cp0_iu_data_vld
                           || branch_sel && branch_rbus_data_vld;
assign rbus_retire_expt_vld_pre = lsu_sel     && lsu_iu_expt_vld
                               || special_sel && special_rbus_expt_vld
                               || cp0_sel     && cp0_iu_expt_vld;
assign rbus_retire_expt_vec_pre[4:0] = {5{lsu_sel}}     & lsu_iu_expt_vec[4:0]
                                     | {5{special_sel}} & special_rbus_expt_vec[4:0]
                                     | {5{cp0_sel}}     & cp0_iu_expt_vec[4:0];
assign rbus_retire_expt_vld = rbus_retire_expt_vld_pre || wb_xx_acc_err_after_retire
                              || prgsign_rbus_secure_violation;
assign rbus_retire_expt_vec_aft_prgsign[4:0] = prgsign_rbus_secure_violation
                                                ? 5'b01000
                                                : rbus_retire_expt_vec_pre[4:0];
assign rbus_retire_expt_vec[4:0] = wb_xx_acc_err_after_retire
                                        ? wb_rbus_lsu_vec[4:0]
                                        : rbus_retire_expt_vec_aft_prgsign[4:0];
assign rbus_retire_split_inst   = mad_ctrl_stall;
assign rbus_wb_dst_reg[4:0]        = (bctm_rbus_wb_vld)
                                     ? bctm_rbus_wb_reg[4:0]
                                     : ifu_iu_ex_rd_reg[4:0];
assign rbus_wb_data[31:0]          =  rbus_data[31:0];
assign rbus_write_back_cmplt = rbus_cmplt && rbus_retire_data_vld;
assign rbus_wb_load          = !lsu_iu_store
                                          && lsu_iu_fast_retire;
assign rbus_wb_store         = lsu_iu_store
                                          && lsu_iu_fast_retire;
assign rbus_wb_cmplt         = rbus_write_back_cmplt || bctm_rbus_wb_vld;
assign rbus_wb_inst_cmplt    = rbus_cmplt;
endmodule
