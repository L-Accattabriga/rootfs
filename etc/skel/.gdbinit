# ==========================
# General Settings
# ==========================
set pagination off                  # Disable pagination for uninterrupted output
set confirm off                     # Disable confirmation prompts
set history save on                 # Save command history between sessions
set history size 10000              # Increase history size
set print pretty on                 # Pretty-print complex structures
set disassembly-flavor intel        # Use Intel syntax for disassembly (if preferred)
set max-value-size unlimited        # Prevent truncation of large values
set auto-load safe-path /           # Allow auto-loading of scripts from safe locations

# ==========================
# Display and Formatting
# ==========================
set print elements 0                # Show all elements of arrays
set print object on                 # Display object information
set print static-members on         # Include static members when printing structs
set print union on                  # Display union members
set width 0                         # No line width limit

# ==========================
# Convenience Aliases
# ==========================
define aliases
  alias b = break                   # Shortcut for breakpoints
  alias r = run                     # Shortcut for run
  alias c = continue                # Shortcut for continue
  alias n = next                    # Shortcut for next line
  alias s = step                    # Shortcut for stepping into functions
  alias p = print                   # Shortcut for print
  alias x = examine                  # Shortcut for memory examination
end

# ==========================
# Enhanced Disassembly View
# ==========================
define disas
  disassemble $arg0
  x/10i $pc                         # Show next 10 instructions after disassembly
end

# ==========================
# Stack and Memory Inspection
# ==========================
define stack
  info registers                    # Show registers
  x/16xw $rsp                       # Show 16 words from stack pointer
end

define mem
  x/32xb $arg0                      # Examine 32 bytes of memory at a given address
end

# ==========================
# Contextual Breakpoints
# ==========================
define bmain
  break main                        # Set a breakpoint at main
  run
end

# ==========================
# Display Information on Stop
# ==========================
define hook-stop
  echo \n---- Stopped at ----\n
  info registers
  info locals
  backtrace
end

# ==========================
# Signal Handling
# ==========================
handle SIGPIPE nostop noprint       # Ignore SIGPIPE signals
handle SIGALRM nostop noprint       # Ignore SIGALRM signals
handle SIGUSR1 nostop noprint       # Ignore SIGUSR1 signals