# A Simple Syntax Analyzer

This repository contains a syntax analyzer (parser) developed using Flex and Bison for a simple programming language grammar. The grammar rules are provided below and implemented in the code.

## Grammar

```
PROG   → STMTS

STMTS  → STMT STMTS | ɛ

STMT   → DTYPE id IDLIST ;
       | id := EXPR ;
       | if ( EXPR ) then BLOCK
       | while ( EXPR ) BLOCK

IDLIST → , id | ɛ

BLOCK  → { STMTS }

EXPR   → EXPR OPTR TERM | TERM
       | ( EXPR ) | neg EXPR

TERM   → id | CONST

DTYPE  → int | float | char

CONST  → ilit | rlit | clit | slit

OPTR   → + | - | * | / | %
```

## Tools Used

- **Flex**: A tool for generating scanners: programs that recognize lexical patterns in text.
- **Bison**: A parser generator that converts an annotated context-free grammar into a deterministic LR or GLR parser.

## Getting Started

### Prerequisites

- **Flex**: Ensure Flex is installed on your system.
- **Bison**: Ensure Bison is installed on your system.

### Running the Analyzer

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/jubayer98/A-Simple-Syntax-Analyzer.git
   cd A-Simple-Syntax-Analyzer
   ```

2. **Generate Scanner and Parser**:
   ```bash
   flex g20.l
   bison -d g20.y
   ```

3. **Compile the Code**:
   ```bash
   gcc lex.yy.c parser.tab.c -o syntax_analyzer
   ```

4. **Run the Analyzer**:
   ```bash
   ./syntax_analyzer < input_file.txt
   ```

## Contribution

Contributions are welcome! Feel free to fork the repository, make improvements, and submit a pull request.

---

Enjoy using the simple syntax analyzer built with Flex and Bison!
