# Updating Hashcards Decks

This skill documents how to modify existing hashcards deck files while understanding the implications.

## Important: Content-Addressable Cards

**Cards are identified by the SHA-256 hash of their text content.**

This means:
- Editing a card's text = creating a new card (new hash)
- The old card becomes an "orphan" in the database
- **Learning progress is reset** when card text changes

### When Progress is Reset

| Change | Progress Reset? |
|--------|-----------------|
| Fix typo in question or answer | Yes |
| Add/remove cloze deletion | Yes |
| Change image path | Yes |
| Add whitespace | Yes |
| Reorder cards in file | No |
| Rename deck file | No |
| Change frontmatter name | No |
| Move deck to different folder | No |

## Update Operations

### 1. Adding New Cards

Simply append new cards to the deck file:

**Before:**
```markdown
Q: What is H2O?
A: Water
```

**After:**
```markdown
Q: What is H2O?
A: Water

---

Q: What is NaCl?
A: Sodium chloride (table salt)
```

**Impact:** No progress lost. New card starts fresh.

### 2. Removing Cards

Delete the card block from the file:

**Before:**
```markdown
Q: What is H2O?
A: Water

---

Q: What is NaCl?
A: Sodium chloride (table salt)
```

**After:**
```markdown
Q: What is H2O?
A: Water
```

**Impact:** 
- The removed card becomes an "orphan" in the database
- Progress is preserved in DB but card won't appear in reviews
- Use `hashcards orphans delete` to clean up orphaned cards

### 3. Correcting Errors (Progress Reset)

When you must fix content errors:

**Before:**
```markdown
Q: What is the speed of light?
A: 299,792,458 km/s
```

**After (fixing unit error):**
```markdown
Q: What is the speed of light?
A: 299,792,458 m/s
```

**Impact:** Progress reset (hash changed). The corrected card is treated as new.

### 4. Reorganizing Cards

Moving cards between positions in the same file or to different files:

**Impact:** No progress lost (card hash unchanged).

**Example - Moving to a new deck:**

From `General.md`:
```markdown
Q: What is the capital of France?
A: Paris
```

To `Geography.md`:
```markdown
Q: What is the capital of France?
A: Paris
```

The card retains its progress because the text content is identical.

### 5. Splitting Cloze Cards

Breaking a complex cloze into simpler cards:

**Before:**
```markdown
C: [Photosynthesis] occurs in [chloroplasts] and produces [glucose] and [oxygen].
```

**After:**
```markdown
C: [Photosynthesis] is the process that converts light energy to chemical energy.

---

C: Photosynthesis occurs in [chloroplasts].

---

C: Photosynthesis produces [glucose] and [oxygen].
```

**Impact:** All cards are new (different hashes). Old 4-deletion card becomes orphan.

### 6. Merging Cards

Combining related cards:

**Before:**
```markdown
Q: What is the chemical symbol for gold?
A: Au

---

Q: What is the atomic number of gold?
A: 79
```

**After:**
```markdown
Q: What is the chemical symbol and atomic number of gold?
A: Au, atomic number 79
```

**Impact:** New card created. Two old cards become orphans.

### 7. Updating Images

Changing an image reference:

**Before:**
```markdown
Q: Identify this element's symbol:

![](images/gold-old.png)

A: Au (Gold)
```

**After:**
```markdown
Q: Identify this element's symbol:

![](images/gold.png)

A: Au (Gold)
```

**Impact:** Progress reset (path is part of card text).

### 8. Changing Deck Metadata

Updating frontmatter or moving files:

**Changing frontmatter name:**
```markdown
---
name = "Chemistry Basics"
---
```
to
```markdown
---
name = "Intro to Chemistry"
---
```

**Impact:** No progress lost. Cards retain their hashes.

## Managing Orphans

After updates that create orphaned cards:

```bash
# List orphaned cards
hashcards orphans list ./cards

# Delete orphaned cards from database
hashcards orphans delete ./cards
```

## Update Strategies

### Strategy 1: Preserve Progress (Metadata-Only Changes)

For changes that don't affect card content:
- Reorder cards
- Move to different decks
- Rename deck files
- Update frontmatter

### Strategy 2: Accept Reset (Content Corrections)

For necessary corrections:
1. Make the edit
2. Accept that progress resets
3. Clean up orphans if desired

### Strategy 3: Add Clarifications as New Cards

Instead of editing existing cards, add supplementary cards:

**Original (keep as-is):**
```markdown
Q: What is the speed of light?
A: ~300,000 km/s
```

**Add new card:**
```markdown
Q: What is the precise speed of light in m/s?
A: 299,792,458 m/s (exact, by definition)
```

### Strategy 4: Gradual Replacement

For major rewrites:
1. Add improved cards
2. Keep old cards temporarily
3. After reviewing new cards several times, remove old ones
4. Clean up orphans

## Batch Update Examples

### Renaming a Topic Across Cards

If you need to update terminology, each affected card will reset:

**Find and replace "machine learning" → "ML":**

Before:
```markdown
C: [Machine learning] is a subset of artificial intelligence.
```

After:
```markdown
C: [ML] (machine learning) is a subset of artificial intelligence.
```

Consider if the terminology change is worth the progress reset.

### Adding Context to Multiple Cards

If cards lack context, you might add deck-level context via frontmatter instead of editing each card:

**Instead of editing each card:**
```markdown
Q: What is the formula?
A: E = mc²
```
to
```markdown
Q: In physics, what is Einstein's mass-energy equivalence formula?
A: E = mc²
```

**Use a descriptive deck name:**
```markdown
---
name = "Physics: Relativity"
---

Q: What is the mass-energy equivalence formula?
A: E = mc²
```

## Validation After Updates

After making changes, verify:

1. **File syntax:** Ensure all cards have proper `Q:/A:` or `C:` format
2. **Separators:** Cards are properly separated
3. **Media paths:** All referenced images/audio exist
4. **Orphan count:** Check `hashcards orphans list` to understand impact

## Code Pattern for Safe Updates

```python
def safe_update_card(deck_path, old_card, new_card):
    """
    Update a card with awareness of progress implications.
    """
    old_hash = compute_hash(old_card)
    new_hash = compute_hash(new_card)
    
    if old_hash == new_hash:
        print("No change detected")
        return
    
    print(f"Warning: Card hash will change")
    print(f"  Old: {old_hash[:8]}...")
    print(f"  New: {new_hash[:8]}...")
    print("Progress will be reset for this card.")
    
    # Perform the update
    content = read_file(deck_path)
    content = content.replace(old_card, new_card)
    write_file(deck_path, content)
    
    print(f"Updated. Run 'hashcards orphans list' to see orphaned cards.")
```

## Summary: Update Decision Tree

```
Need to modify a card?
│
├─ Is it a content change (Q, A, or cloze text)?
│   │
│   ├─ Yes → Progress will reset
│   │   ├─ Is the correction necessary? → Make the edit
│   │   └─ Can you add a new card instead? → Add supplementary card
│   │
│   └─ No (metadata only) → Progress preserved
│
└─ Is it a structural change?
    ├─ Reordering → Progress preserved
    ├─ Moving between files → Progress preserved (if text identical)
    └─ Splitting/merging → Creates new cards, old become orphans
```
