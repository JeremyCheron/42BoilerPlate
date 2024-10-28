# 42 Boilerplate

Ce projet est un boilerplate conçu pour démarrer rapidement les projets de l’école 42. Il contient toutes les fonctions de base nécessaires, issues de trois projets fondamentaux du cursus : **libft**, **ft_printf**, et **get_next_line**.

## Structure du Projet

Le projet est structuré en trois répertoires principaux :

- **libft/** : Contient toutes les fonctions de la bibliothèque de base.
- **ft_printf/** : Implémentation de `ft_printf`.
- **get_next_line/** : Fonction permettant la lecture ligne par ligne à partir d’un descripteur de fichier.

### Contenu détaillé des fichiers

| Dossier               | Fichiers / Fonctions                                                                 |
|-----------------------|--------------------------------------------------------------------------------------|
| **libft/**            | Fonctions de manipulation de chaînes, de mémoire, conversions, et utilitaires (e.g., `ft_strlen`, `ft_split`, `ft_memcpy`). |
| **ft_printf/**        | `ft_printf` ainsi que des fonctions pour chaque type de conversion (`ft_print_c`, `ft_print_d`, `ft_print_s`, `ft_print_x`, etc.). |
| **get_next_line/**    | `get_next_line` et `get_next_line_utils`, pour la lecture progressive de fichiers.  |

### Compilation

Le projet contient un `Makefile` permettant de compiler l'ensemble des fonctions en une archive statique `libftfull.a`. Voici les principales commandes :

- **`make`** ou **`make all`** : Compile l’archive `libftfull.a`.
- **`make clean`** : Supprime les fichiers objets.
- **`make fclean`** : Supprime les fichiers objets et l’archive `libftfull.a`.
- **`make re`** : Relance une compilation complète après nettoyage.

### Intégration

L'archive `libftfull.a` peut être incluse dans n'importe quel projet C, avec les headers correspondants.\
Ajouter `-L.` et `-lftfull` lors de la compilation du projet pour utiliser toutes les fonctions incluses.

### Exemple de compilation

```bash
gcc main.c -L. -lftfull -o mon_programme
```

## Détails Techniques
- **`Compatibilité`** : Compatible avec les flags -Wall -Werror -Wextra.
- **`Dépendances`** : Aucun lien avec des bibliothèques externes, tout est fait maison !
- **`École 42`** : Respecte les standards de l'école 42, notamment avec la norme de code 42.
