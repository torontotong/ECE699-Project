// ============================================================================
// Copyright (c) 2018 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development
//   Kits made by Terasic.  Other use of this code, including the selling
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use
//   or functionality of this code.
//
// ============================================================================
//
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Wed Jan 31 14:15:58 2018
// ============================================================================

//`define ENABLE_DDR4A
//`define ENABLE_DDR4B
//`define ENABLE_DDR4C
//`define ENABLE_DDR4D
//`define ENABLE_PCIE
//`define ENABLE_QSFP28A
//`define ENABLE_QSFP28B
//`define ENABLE_QSFP28C
//`define ENABLE_QSFP28D
//`define ENABLE_HPS

module de10_pro(

      ///////// CLOCK /////////
      input              CLK_100_B3I,
      input              CLK_50_B2C,
      input              CLK_50_B2L,
      input              CLK_50_B3C,
      input              CLK_50_B3I,
      input              CLK_50_B3L,

      ///////// Buttons /////////
      input              CPU_RESET_n,
      input    [ 1: 0]   BUTTON,


      ///////// Swtiches /////////
      input    [ 1: 0]   SW,

      ///////// LED /////////
      output   [ 3: 0]   LED, //LED is Low-Active

      ///////// FLASH /////////
      output             FLASH_CLK,
      output   [27: 1]   FLASH_A,
      inout    [15: 0]   FLASH_D,
      output             FLASH_CE_n,
      output             FLASH_WE_n,
      output             FLASH_OE_n,
      output             FLASH_ADV_n,
      output             FLASH_RESET_n,
      input              FLASH_RDY_BSY_n,

`ifdef ENABLE_DDR4A
      ///////// DDR4A /////////
      input              DDR4A_REFCLK_p,
      output   [16: 0]   DDR4A_A,
      output   [ 1: 0]   DDR4A_BA,
      output   [ 1: 0]   DDR4A_BG,
      output             DDR4A_CK,
      output             DDR4A_CK_n,
      output             DDR4A_CKE,
      inout    [ 8: 0]   DDR4A_DQS,
      inout    [ 8: 0]   DDR4A_DQS_n,
      inout    [71: 0]   DDR4A_DQ,
      inout    [ 8: 0]   DDR4A_DBI_n,
      output             DDR4A_CS_n,
      output             DDR4A_RESET_n,
      output             DDR4A_ODT,
      output             DDR4A_PAR,
      input              DDR4A_ALERT_n,
      output             DDR4A_ACT_n,
      input              DDR4A_EVENT_n,
      inout              DDR4A_SCL,
      inout              DDR4A_SDA,
      input              DDR4A_RZQ,
`endif /*ENABLE_DDR4A*/

`ifdef ENABLE_DDR4B
      ///////// DDR4B /////////
      input              DDR4B_REFCLK_p,
      output   [16: 0]   DDR4B_A,
      output   [ 1: 0]   DDR4B_BA,
      output   [ 1: 0]   DDR4B_BG,
      output             DDR4B_CK,
      output             DDR4B_CK_n,
      output             DDR4B_CKE,
      inout    [ 8: 0]   DDR4B_DQS,
      inout    [ 8: 0]   DDR4B_DQS_n,
      inout    [71: 0]   DDR4B_DQ,
      inout    [ 8: 0]   DDR4B_DBI_n,
      output             DDR4B_CS_n,
      output             DDR4B_RESET_n,
      output             DDR4B_ODT,
      output             DDR4B_PAR,
      input              DDR4B_ALERT_n,
      output             DDR4B_ACT_n,
      input              DDR4B_EVENT_n,
      inout              DDR4B_SCL,
      inout              DDR4B_SDA,
      input              DDR4B_RZQ,
`endif /*ENABLE_DDR4B*/

`ifdef ENABLE_DDR4C
      ///////// DDR4C /////////
      input              DDR4C_REFCLK_p,
      output   [16: 0]   DDR4C_A,
      output   [ 1: 0]   DDR4C_BA,
      output   [ 1: 0]   DDR4C_BG,
      output             DDR4C_CK,
      output             DDR4C_CK_n,
      output             DDR4C_CKE,
      inout    [ 8: 0]   DDR4C_DQS,
      inout    [ 8: 0]   DDR4C_DQS_n,
      inout    [71: 0]   DDR4C_DQ,
      inout    [ 8: 0]   DDR4C_DBI_n,
      output             DDR4C_CS_n,
      output             DDR4C_RESET_n,
      output             DDR4C_ODT,
      output             DDR4C_PAR,
      input              DDR4C_ALERT_n,
      output             DDR4C_ACT_n,
      input              DDR4C_EVENT_n,
      inout              DDR4C_SCL,
      inout              DDR4C_SDA,
      input              DDR4C_RZQ,
`endif /*ENABLE_DDR4C*/

`ifdef ENABLE_DDR4D
      ///////// DDR4D /////////
      input              DDR4D_REFCLK_p,
      output   [16: 0]   DDR4D_A,
      output   [ 1: 0]   DDR4D_BA,
      output   [ 1: 0]   DDR4D_BG,
      output             DDR4D_CK,
      output             DDR4D_CK_n,
      output             DDR4D_CKE,
      inout    [ 8: 0]   DDR4D_DQS,
      inout    [ 8: 0]   DDR4D_DQS_n,
      inout    [71: 0]   DDR4D_DQ,
      inout    [ 8: 0]   DDR4D_DBI_n,
      output             DDR4D_CS_n,
      output             DDR4D_RESET_n,
      output             DDR4D_ODT,
      output             DDR4D_PAR,
      input              DDR4D_ALERT_n,
      output             DDR4D_ACT_n,
      input              DDR4D_EVENT_n,
      inout              DDR4D_SCL,
      inout              DDR4D_SDA,
      input              DDR4D_RZQ,
`endif /*ENABLE_DDR4D*/

      ///////// SI5340A0 /////////
      inout              SI5340A0_I2C_SCL,
      inout              SI5340A0_I2C_SDA,
      input              SI5340A0_INTR,
      output             SI5340A0_OE_n,
      output             SI5340A0_RST_n,

      ///////// SI5340A1 /////////
      inout              SI5340A1_I2C_SCL,
      inout              SI5340A1_I2C_SDA,
      input              SI5340A1_INTR,
      output             SI5340A1_OE_n,
      output             SI5340A1_RST_n,

      ///////// I2Cs /////////
      inout              FAN_I2C_SCL,
      inout              FAN_I2C_SDA,
      input              FAN_ALERT_n,
      inout              POWER_MONITOR_I2C_SCL,
      inout              POWER_MONITOR_I2C_SDA,
      input              POWER_MONITOR_ALERT_n,
      inout              TEMP_I2C_SCL,
      inout              TEMP_I2C_SDA,

      ///////// GPIO /////////
      inout    [ 1: 0]   GPIO_CLK,
      inout    [ 3: 0]   GPIO_P,

`ifdef ENABLE_PCIE
      ///////// PCIE /////////
      inout              PCIE_SMBCLK,
      inout              PCIE_SMBDAT,
      input              PCIE_REFCLK_p,
      output   [15: 0]   PCIE_TX_p,
      input    [15: 0]   PCIE_RX_p,
      input              PCIE_PERST_n,
      output             PCIE_WAKE_n,
`endif /*ENABLE_PCIE*/

`ifdef ENABLE_QSFP28A
      ///////// QSFP28A /////////
      input              QSFP28A_REFCLK_p,
      output   [ 3: 0]   QSFP28A_TX_p,
      input    [ 3: 0]   QSFP28A_RX_p,
      input              QSFP28A_INTERRUPT_n,
      output             QSFP28A_LP_MODE,
      input              QSFP28A_MOD_PRS_n,
      output             QSFP28A_MOD_SEL_n,
      output             QSFP28A_RST_n,
      inout              QSFP28A_SCL,
      inout              QSFP28A_SDA,
`endif /*ENABLE_QSFP28A*/

`ifdef ENABLE_QSFP28B
      ///////// QSFP28B /////////
      input              QSFP28B_REFCLK_p,
      output   [ 3: 0]   QSFP28B_TX_p,
      input    [ 3: 0]   QSFP28B_RX_p,
      input              QSFP28B_INTERRUPT_n,
      output             QSFP28B_LP_MODE,
      input              QSFP28B_MOD_PRS_n,
      output             QSFP28B_MOD_SEL_n,
      output             QSFP28B_RST_n,
      inout              QSFP28B_SCL,
      inout              QSFP28B_SDA,
`endif /*ENABLE_QSFP28B*/

`ifdef ENABLE_QSFP28C
      ///////// QSFP28C /////////
      input              QSFP28C_REFCLK_p,
      output   [ 3: 0]   QSFP28C_TX_p,
      input    [ 3: 0]   QSFP28C_RX_p,
      input              QSFP28C_INTERRUPT_n,
      output             QSFP28C_LP_MODE,
      input              QSFP28C_MOD_PRS_n,
      output             QSFP28C_MOD_SEL_n,
      output             QSFP28C_RST_n,
      inout              QSFP28C_SCL,
      inout              QSFP28C_SDA,
`endif /*ENABLE_QSFP28C*/

`ifdef ENABLE_QSFP28D
      ///////// QSFP28D /////////
      input              QSFP28D_REFCLK_p,
      output   [ 3: 0]   QSFP28D_TX_p,
      input    [ 3: 0]   QSFP28D_RX_p,
      input              QSFP28D_INTERRUPT_n,
      output             QSFP28D_LP_MODE,
      input              QSFP28D_MOD_PRS_n,
      output             QSFP28D_MOD_SEL_n,
      output             QSFP28D_RST_n,
      inout              QSFP28D_SCL,
      inout              QSFP28D_SDA,
`endif /*ENABLE_QSFP28D*/


`ifdef ENABLE_HPS
      ///////// HPS /////////

      // USB
      input              HPS_USB0_CLK,
      output             HPS_USB0_STP,
      input              HPS_USB0_DIR,
      inout    [ 7: 0]   HPS_USB0_DATA,
      input              HPS_USB0_NXT,

      // Ethernet
      output             HPS_EMAC0_TX_CLK,
      output             HPS_EMAC0_TX_CTL,
      input              HPS_EMAC0_RX_CLK,
      input              HPS_EMAC0_RX_CTL,
      output   [ 3: 0]   HPS_EMAC0_TXD,
      input    [ 3: 0]   HPS_EMAC0_RXD,
      inout              HPS_EMAC0_MDIO,
      output             HPS_EMAC0_MDC,

      // uart
      output             HPS_UART0_TX,
      input              HPS_UART0_RX,
      output             HPS_FPGA_UART1_TX,
      input              HPS_FPGA_UART1_RX,

      // sdcard
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout    [ 3: 0]   HPS_SD_DATA,
      input              HPS_OSC_CLK,

      // user io
      inout              HPS_LED,
      inout              HPS_KEY,

      // card detection
      inout              HPS_CARD_PRSNT_n,

`endif /*ENABLE_HPS*/


       ///////// EXP /////////
      input              EXP_EN,

      ///////// UFL /////////
      inout              UFL_CLKIN_p,
      inout              UFL_CLKIN_n

);


//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================




endmodule
