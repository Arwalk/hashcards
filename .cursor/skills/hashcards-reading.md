# Reading Hashcards Decks

This skill documents how to read and parse hashcards deck files.

## Finding Decks

1. **Locate all deck files:** Find all `.md` files in the collection
2. **Identify deck names:** Extract from filename or TOML frontmatter
3. **Parse cards:** Extract Q&A and cloze cards from each file

## Parsing Algorithm

### Step 1: Check for Frontmatter

If the file starts with `---`, parse TOML frontmatter until the closing `---`:

```
---
name = "Custom Name"
---
```

Extract the `name` field if present; otherwise use the filename without extension.

### Step 2: Split into Card Blocks

Split the remaining content by:
- Horizontal rules (`---` on its own line)
- Double newlines (blank lines)

### Step 3: Identify Card Types

For each block, check the first non-whitespace content:

| Prefix | Card Type |
|--------|-----------|
| `Q:` | Question-Answer card |
| `C:` | Cloze deletion card |

### Step 4: Parse Card Content

**For Q&A cards:**
1. Find `Q:` line - everything after is the question
2. Find `A:` line - everything after is the answer
3. Both can span multiple lines

**For Cloze cards:**
1. Find `C:` line - everything after is the cloze text
2. Extract deletions marked with `[...]`
3. Each `[deletion]` creates a separate card instance

## Parsing Examples

### Example 1: Simple Q&A

**Input:**
```
Q: What is 2+2?
A: 4
```

**Parsed:**
```json
{
  "type": "qa",
  "question": "What is 2+2?",
  "answer": "4"
}
```

### Example 2: Multi-line Q&A

**Input:**
```
Q: List the primary colors.
A:
- Red
- Blue
- Yellow
```

**Parsed:**
```json
{
  "type": "qa",
  "question": "List the primary colors.",
  "answer": "- Red\n- Blue\n- Yellow"
}
```

### Example 3: Cloze Card

**Input:**
```
C: Water is composed of [hydrogen] and [oxygen].
```

**Parsed:**
```json
{
  "type": "cloze",
  "text": "Water is composed of [hydrogen] and [oxygen].",
  "deletions": ["hydrogen", "oxygen"],
  "card_count": 2
}
```

### Example 4: Multi-line Cloze

**Input:**
```
C:
The quick brown [fox] jumps over
the lazy [dog].
```

**Parsed:**
```json
{
  "type": "cloze",
  "text": "The quick brown [fox] jumps over\nthe lazy [dog].",
  "deletions": ["fox", "dog"],
  "card_count": 2
}
```

## Reading a Complete Deck

**Input file: `Geography.md`**
```
Q: What is the largest ocean?
A: The Pacific Ocean

---

C: The [Nile] is the longest river in [Africa].

Q: What is the capital of Japan?
A: Tokyo
```

**Parsed deck:**
```json
{
  "name": "Geography",
  "source_file": "Geography.md",
  "cards": [
    {
      "type": "qa",
      "question": "What is the largest ocean?",
      "answer": "The Pacific Ocean"
    },
    {
      "type": "cloze",
      "text": "The [Nile] is the longest river in [Africa].",
      "deletions": ["Nile", "Africa"]
    },
    {
      "type": "qa",
      "question": "What is the capital of Japan?",
      "answer": "Tokyo"
    }
  ]
}
```

## Extracting Statistics

When reading decks, you can compute:

1. **Card counts:** Total cards, Q&A cards, cloze cards
2. **Cloze instances:** Each deletion = 1 reviewable card
3. **Media references:** Images and audio files used
4. **LaTeX usage:** Cards containing math expressions

## Handling Edge Cases

### Empty Lines in Cards

Preserve empty lines within card content:
```
Q: What is the structure?
A:

Line 1

Line 2
```

### Nested Brackets in Cloze

Only top-level brackets are deletions:
```
C: The formula is $[a+b]$ where [a] and [b] are constants.
```
- `$[a+b]$` is LaTeX, not a deletion (inside `$...$`)
- `[a]` and `[b]` are deletions

### Cards with Images

Parse image markdown and resolve paths:
```
Q: Identify:

![alt text](path/to/image.png)

A: Description
```

## Code Pattern for Reading

```python
def parse_deck(filepath):
    content = read_file(filepath)
    deck_name = get_deck_name(filepath, content)
    
    # Remove frontmatter if present
    content = strip_frontmatter(content)
    
    # Split into card blocks
    blocks = split_into_blocks(content)
    
    cards = []
    for block in blocks:
        block = block.strip()
        if not block:
            continue
        if block.startswith('Q:'):
            cards.append(parse_qa_card(block))
        elif block.startswith('C:'):
            cards.append(parse_cloze_card(block))
    
    return {'name': deck_name, 'cards': cards}

def parse_qa_card(block):
    # Find Q: and A: markers
    q_match = re.search(r'^Q:\s*(.+?)(?=^A:)', block, re.MULTILINE | re.DOTALL)
    a_match = re.search(r'^A:\s*(.+)$', block, re.MULTILINE | re.DOTALL)
    return {
        'type': 'qa',
        'question': q_match.group(1).strip(),
        'answer': a_match.group(1).strip() if a_match else ''
    }

def parse_cloze_card(block):
    text = re.sub(r'^C:\s*', '', block, flags=re.MULTILINE).strip()
    deletions = re.findall(r'\[([^\]]+)\]', text)
    return {
        'type': 'cloze',
        'text': text,
        'deletions': deletions
    }
```
