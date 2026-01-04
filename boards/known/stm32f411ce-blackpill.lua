-- STM32F411CE Blackpill build configuration
-- WeAct STM32F411CEU6 Black Pill V2.0/V3.x
-- Float support enabled by default (hardware FPU used automatically)
return {
  cpu = 'stm32f411ce',
  components = {
    -- USB CDC for console (Blackpill has native USB)
    sercon = { uart = "cdc", speed = 115200 },
    romfs = true,
    cdc = { buf_size = 128 },
    shell = { advanced = true },
    term = { lines = 25, cols = 80 },
    linenoise = { shell_lines = 10, lua_lines = 50 },
    stm32f4_enc = true,
    -- RPC over UART1 (PA9/PA10)
    rpc = { uart = "1", speed = 115200 },
    adc = { buf_size = 2 },
    xmodem = true,
    cints = true, 
    luaints = true
  },
  config = {
    egc = { mode = "alloc" },
    vtmr = { num = 4, freq = 10 },
    -- STM32F411CE has 128KB SRAM (single bank)
    ram = { internal_rams = 1 },
    -- Blackpill V2.0/V3.x has 25MHz external crystal (HSE)
    -- Max CPU frequency for F411 is 100MHz
    clocks = { external = 25000000, cpu = 100000000 },
    -- Alternative: use UART1 for console instead of USB CDC
    -- Uncomment these lines and change sercon to uart = "1"
    -- stm32f4_uart_pins = { con_rx_port = 0, con_rx_pin = 10, con_tx_port = 0, con_tx_pin = 9 }
  },
  modules = {
    generic = { 'all', "-i2c", "-net" },
    platform = 'all',
  },
}