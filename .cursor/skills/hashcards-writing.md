# Writing Hashcards Decks

This skill documents how to create new hashcards deck files.

## Creating a New Deck

### Step 1: Choose a Filename

- Use a descriptive name for the topic: `Biology.md`, `French Vocabulary.md`
- The filename becomes the deck name (without `.md` extension)
- Use subdirectories for organization: `Languages/French.md`

### Step 2: Add Frontmatter (Optional)

If you want a custom deck name different from the filename:

```markdown
---
name = "French Vocabulary"
---
```

### Step 3: Write Cards

Add cards using Q&A or cloze format, separated by blank lines or `---`.

## Writing Q&A Cards

### Basic Format

```markdown
Q: <your question>
A: <your answer>
```

### Guidelines

1. **Question on one line or multiple:**
   ```markdown
   Q: What is the speed of light?
   A: Approximately 299,792,458 meters per second.
   ```

2. **Multi-line answers:**
   ```markdown
   Q: What are the three states of matter?
   A:
   - Solid
   - Liquid
   - Gas
   ```

3. **Include context in the question:**
   ```markdown
   Q: In chemistry, what is Avogadro's number?
   A: 6.022 × 10²³, the number of particles in one mole.
   ```

## Writing Cloze Cards

### Basic Format

```markdown
C: <text with [deletions] in square brackets>
```

### Guidelines

1. **Single deletion:**
   ```markdown
   C: The capital of France is [Paris].
   ```

2. **Multiple deletions (creates multiple cards):**
   ```markdown
   C: [Photosynthesis] converts [light energy] into [chemical energy].
   ```
   This creates 3 separate review cards.

3. **Multi-line cloze:**
   ```markdown
   C:
   The mitochondria is the [powerhouse] of the cell,
   responsible for producing [ATP].
   ```

4. **Cloze for quotes and citations:**
   ```markdown
   C:
   "To be or not to be, that is the question."
   — [William Shakespeare], [Hamlet]
   ```

## Adding Media

### Images

```markdown
Q: Identify this landmark:

![](images/eiffel-tower.jpg)

A: The Eiffel Tower in Paris, France.
```

### Audio

```markdown
Q: How is "merci" pronounced in French?
A: ![](audio/merci.mp3)
```

### Image Path Resolution

- **Relative to deck:** `![](images/photo.jpg)` resolves from the deck's directory
- **Relative to root:** `![](@/shared/images/photo.jpg)` resolves from collection root

## Adding LaTeX Math

### Inline Math

```markdown
Q: What is the formula for the area of a circle?
A: $A = \pi r^2$
```

### Display Math

```markdown
Q: State the quadratic formula.
A:
$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$
```

### Using Custom Macros

1. Create `macros.tex` in the collection root:
   ```
   \R \mathbb{R}
   \N \mathbb{N}
   \implies \Rightarrow
   ```

2. Use in cards:
   ```markdown
   Q: What is the domain of f(x) = √x?
   A: $x \in \R, x \geq 0$ (or $[0, \infty)$)
   ```

## Complete Deck Template

```markdown
---
name = "Topic Name"
---

Q: First question?
A: First answer.

---

Q: Second question with multiple lines?
A:
- Point 1
- Point 2
- Point 3

---

C: A [cloze] card tests [recall] of specific terms.

---

Q: Question with math?
A: The answer is $E = mc^2$.

---

Q: Question with image:

![](images/diagram.png)

A: Description of what the image shows.

---

C:
Multi-line cloze card about [topic]
that spans multiple [lines].
```

## Best Practices for Card Writing

### Atomic Cards

**Bad:**
```markdown
Q: What are Newton's three laws of motion?
A: First law: inertia. Second law: F=ma. Third law: action-reaction.
```

**Good:**
```markdown
Q: What is Newton's First Law of Motion?
A: An object at rest stays at rest, and an object in motion stays in motion, unless acted upon by an external force. (Law of Inertia)

---

Q: What is Newton's Second Law of Motion?
A: Force equals mass times acceleration (F = ma).

---

Q: What is Newton's Third Law of Motion?
A: For every action, there is an equal and opposite reaction.
```

### Use Cloze for Definitions

**Good:**
```markdown
C: [Entropy] is a measure of [disorder] in a thermodynamic system.
```

### Provide Context

**Bad:**
```markdown
Q: When was it founded?
A: 1776
```

**Good:**
```markdown
Q: When was the United States founded?
A: 1776 (Declaration of Independence signed July 4th)
```

### Use Images for Visual Learning

```markdown
Q: What type of triangle is shown?

![](geometry/right-triangle.png)

A: A right triangle (has one 90° angle).
```

## File Organization Examples

### Flat Structure
```
cards/
  Biology.md
  Chemistry.md
  Physics.md
  macros.tex
```

### Nested Structure
```
cards/
  Science/
    Biology/
      Cell Biology.md
      Genetics.md
    Chemistry/
      Organic.md
      Inorganic.md
  Languages/
    French/
      Vocabulary.md
      Grammar.md
  images/
    cell-diagram.png
  macros.tex
```

### Textbook Structure
```
Calculus/
  Ch01-Limits.md
  Ch02-Derivatives.md
  Ch03-Integrals.md
  images/
    limit-graph.png
    derivative-example.png
```

Each chapter file uses frontmatter:
```markdown
---
name = "Calculus"
---
```

## Validation Checklist

Before finalizing a deck:

- [ ] Each Q&A card has both `Q:` and `A:` sections
- [ ] Cloze cards have at least one `[deletion]`
- [ ] Cards are separated by blank lines or `---`
- [ ] Image/audio paths are correct and files exist
- [ ] LaTeX syntax is valid
- [ ] No duplicate cards
- [ ] Cards are atomic (one fact per card)
- [ ] Questions are clear and unambiguous
- [ ] Run `hashcards check cards` to ensure everything is ok.
