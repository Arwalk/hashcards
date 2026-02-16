# Hashcards Best Practices

Rules for creating effective flashcards based on proven spaced repetition principles. These rules ensure cards are memorable, efficient, and enjoyable to review.

## Core Principles

### 1. Understand Before Memorizing

**Never create cards for content you don't understand.**

- Concepts must be clear in your head before committing to cards
- Dig deeper, expand, and clarify until comfortable with the material
- When reading a source, keep a scratchpad of tentative cards, then organize at the end

**Bad:**
```
Q: What is the Riemann hypothesis?
A: All non-trivial zeros of the Riemann zeta function have real part 1/2.
```
(If you don't understand what this means, the card is useless)

**Good:** First understand what the zeta function is, what zeros mean, what "non-trivial" means, then create cards for each concept.

---

### 2. Write Atomic Cards (MOST IMPORTANT)

**Cards should be as small as possible—like chemical bonds linking atoms of knowledge.**

This is the most critical rule. The worst failure mode is putting too much in one card.

**Why atomicity matters:**
1. Larger cards are harder to remember
2. Difficult to grade yourself objectively (some parts right, some wrong)
3. Over-review what you know, under-review what you don't

**Bad:**
```
Q: What are the functional categories of neurons?
A: 
- Sensory: feed information into the brain
- Motor: send commands to muscles  
- Interneurons: connect within the CNS
```

**Good:** Separate terms from definitions:
```
Q: What are the functional categories of neurons?
A: Sensory, motor, interneurons.

---

Q: What are sensory neurons?
A: Neurons that feed information into the brain.

---

Q: What are motor neurons?
A: Neurons that send commands to muscles.

---

Q: What are interneurons?
A: Neurons that connect within the CNS.
```

---

### 3. Write Two-Way Questions

**Ask questions in both directions: term→definition AND definition→term.**

**For terms and definitions:**
```
Q: What is the order of a group?
A: The cardinality of its underlying set.

---

Q: What is the term for the cardinality of a group?
A: The group's order.
```

**For notation:**
```
Q: What does $\mathbb{R}$ stand for?
A: The set of real numbers.

---

Q: What is the notation for the set of real numbers?
A: $\mathbb{R}$
```

---

### 4. Ask Questions in Multiple Ways

**Ask formal and informal definitions. Add contextual and linking questions.**

```
Q: Informally, what is a vector space?
A: A set whose elements can be added or scaled.

---

Q: Formally, what is a vector space?
A: A set $V$ over a field $\mathbb{F}$ with vector addition ($V \times V \to V$) and scalar multiplication ($V \times \mathbb{F} \to V$) satisfying certain axioms.

---

Q: What is the term for a set whose elements can be added or scaled?
A: A vector space.
```

---

### 5. Use Hierarchies (Top-Down and Bottom-Up)

**For hierarchical knowledge, ask questions in both directions.**

Given: "Cells in the nervous system are neurons and glia. Glia divide into microglia and macroglia."

**Top-down questions:**
```
Q: What kinds of cells make up the nervous system?
A: Neurons and glia.

---

Q: What are the kinds of glial cells?
A: Microglia and macroglia.
```

**Bottom-up questions:**
```
Q: Astrocytes are a kind of...
A: Macroglia.

---

Q: Macroglia are a kind of...
A: Glial cell.
```

---

### 6. Separate Lists from Definitions

**When learning a list of things with definitions, create separate cards.**

**Bad:**
```
Q: What are the magma-forming processes and why do they work?
A: 
1. Increasing temperature: melts rock
2. Decreasing pressure: atoms more free to move
3. Addition of water: lowers melting point by disrupting crystal bonds
```

**Good:**
```
Q: What are the magma-forming processes?
A: Increasing temperature, decreasing pressure, addition of water.

---

Q: Why does decreasing pressure melt rock?
A: Because atoms are more free to move.

---

Q: Why does adding water lower the melting point of rock?
A: Water molecules disrupt the bonds in rock minerals.
```

---

### 7. Learning Sequences

**For ordered sequences, create multiple card types.**

For a sequence (A, B, C, D):

**Position cards:**
```
Q: What is the 1st element?
A: A

---

Q: What is the position of B?
A: 2
```

**Successor/predecessor cards:**
```
Q: What comes after B?
A: C

---

Q: What comes before C?
A: B
```

**Test card:**
```
Q: List all elements in order.
A: A, B, C, D
```

**Cloze sequence:**
```
C: The sequence is [A], [B], [C], [D].
```

---

### 8. Cache Your Insights

**When you deduce something not explicitly in the source, make a card for it.**

Given: "The dissociation constant ($K_d$) is the drug concentration where half the binding sites are occupied."

You can deduce:
- High $K_d$ → low affinity (needs more drug)
- Low $K_d$ → high affinity (needs less drug)
- $K_d$ is inversely proportional to affinity

**Create cards for these insights:**
```
Q: What does a low $K_d$ value indicate?
A: High binding affinity.

---

Q: Why does low $K_d$ imply high affinity?
A: Fewer molecules are needed to reach the same occupancy.

---

Q: Describe the relationship between $K_d$ and binding affinity.
A: $K_d$ is inversely proportional to binding affinity.
```

---

### 9. Repeat Yourself (Redundancy is Good)

**Memory is frequency × volume. Individual cards should be brief, but your deck can be repetitive.**

It's fine to have multiple cards that reinforce the same concept from different angles:
- Forward and backward questions
- Formal and informal definitions
- Term-to-definition and definition-to-term
- Contextual questions linking to other concepts

---

### 10. Keep Cards Fun and Fast

**Frustrating cards kill the habit.**

- Break long cards into smaller ones (fast to answer = satisfying)
- Maintain diverse topics (prevents boredom)
- Cards that are hard to recall often need to be rewritten

---

## Card Patterns

### Pattern: Term Definition
```
Q: What is [term]?
A: [definition]

---

Q: What is the term for [definition]?
A: [term]
```

### Pattern: Notation
```
Q: What does [notation] mean?
A: [meaning]

---

Q: What is the notation for [meaning]?
A: [notation]
```

### Pattern: Hierarchy
```
Q: What are the types of [parent]?
A: [child1], [child2], [child3]

---

Q: [child1] is a type of...
A: [parent]
```

### Pattern: Process/Mechanism
```
Q: What are the steps of [process]?
A: Step 1, Step 2, Step 3

---

Q: What happens in Step 1 of [process]?
A: [explanation]

---

Q: Why does Step 1 of [process] work?
A: [reason]
```

### Pattern: Cause and Effect
```
Q: What causes [effect]?
A: [cause]

---

Q: What is the effect of [cause]?
A: [effect]
```

### Pattern: Comparison
```
Q: What is the difference between [A] and [B]?
A: [A] has [property1], while [B] has [property2].

---

Q: Which has [property1]: [A] or [B]?
A: [A]
```

### Pattern: Formula/Equation
```
Q: State the formula for [concept].
A: $[formula]$

---

Q: What does $[formula]$ represent?
A: [concept]
```

---

## Complete Example: Plate Tectonics

**Source material:**
> The zone where tectonic plates meet is called a plate boundary. There are three kinds:
> 1. Convergent: plates come together
> 2. Divergent: plates move apart
> 3. Transform: plates slide past each other

**Generated cards:**

```markdown
Q: What is a plate boundary?
A: The place where tectonic plates meet.

---

Q: What is the term for the place where tectonic plates meet?
A: Plate boundary.

---

Q: What are the types of plate boundary?
A: Convergent, divergent, transform.

---

Q: What is a convergent boundary?
A: Where tectonic plates come together.

---

Q: What is a divergent boundary?
A: Where tectonic plates move apart.

---

Q: What is a transform boundary?
A: Where tectonic plates slide past each other.

---

Q: What is the term for a boundary where plates come together?
A: Convergent boundary.

---

Q: What is the term for a boundary where plates move apart?
A: Divergent boundary.

---

Q: What is the term for a boundary where plates slide past each other?
A: Transform boundary.
```

---

## Cloze Card Best Practices

**Use cloze for:**
- Related facts that should be tested together
- Fill-in-the-blank recall
- Definitions with key terms

**Keep deletions focused:**
```
C: The [mitochondria] is the [powerhouse] of the cell.
```

**Don't over-delete:**
```
# Bad - too many deletions makes it confusing
C: The [mitochondria] is the [powerhouse] of the [cell], producing [ATP] through [cellular respiration].

# Good - split into multiple cards
C: The [mitochondria] is the [powerhouse] of the cell.

---

C: Mitochondria produce [ATP] through [cellular respiration].
```

---

## Anti-Patterns to Avoid

### 1. Cards That Are Too Long
Split them up. If you can't answer in 2-3 seconds, the card is too big.

### 2. Memorizing Without Understanding
If you don't understand it, don't card it.

### 3. One-Way Questions Only
Always consider the reverse question.

### 4. Lists With Definitions Combined
Separate the list from the individual definitions.

### 5. Vague Questions
```
# Bad
Q: Explain photosynthesis.

# Good
Q: What is photosynthesis?
A: The process by which plants convert light energy into chemical energy.

Q: Where does photosynthesis occur?
A: In the chloroplasts.

Q: What are the inputs of photosynthesis?
A: Light, water, and carbon dioxide.

Q: What are the outputs of photosynthesis?
A: Glucose and oxygen.
```

### 6. Missing Context
```
# Bad
Q: When was it founded?
A: 1776

# Good
Q: When was the United States founded?
A: 1776 (Declaration of Independence)
```

---

## Checklist Before Creating Cards

- [ ] Do I understand this material?
- [ ] Is each card atomic (one fact)?
- [ ] Have I created two-way questions where applicable?
- [ ] Are lists separated from definitions?
- [ ] Have I captured my own insights/deductions?
- [ ] Can I answer each card in 2-3 seconds?
- [ ] Is there enough context in each question?
