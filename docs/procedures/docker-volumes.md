# Persistance des données Docker

## Objectif

Mettre en place une stratégie de persistance des données pour les services Docker du lab DevOps.

Les volumes Docker permettent de conserver les données indépendamment du cycle de vie des conteneurs.

## Volume utilisé

Le volume principal créé pour cette phase est :

```text
app-volume
```

## Commandes de mise en place

Lister les volumes existants :

```bash
docker volume ls
```

Créer le volume :

```bash
docker volume create app-volume
```

Vérifier la création :

```bash
docker volume ls
```

Inspecter le volume :

```bash
docker volume inspect app-volume
```

## Validation de la persistance

Un conteneur temporaire est utilisé uniquement pour valider que le volume conserve les données.

Créer un conteneur avec le volume monté dans `/data` :

```bash
docker run -dit --name volume-test \
-v app-volume:/data \
alpine sh
```

Créer un fichier persistant :

```bash
docker exec volume-test sh -c "echo 'Bonjour DevOps' > /data/test.txt"
```

Vérifier le contenu :

```bash
docker exec volume-test cat /data/test.txt
```

Supprimer le conteneur :

```bash
docker rm -f volume-test
```

Recréer un nouveau conteneur avec le même volume :

```bash
docker run -dit --name volume-test2 \
-v app-volume:/data \
alpine sh
```

Vérifier que les données sont toujours présentes :

```bash
docker exec volume-test2 cat /data/test.txt
```

## Résultat attendu

```text
Bonjour DevOps
```

## Conclusion

Le volume `app-volume` permet de conserver les données même après la suppression ou la recréation d'un conteneur.

Cette persistance sera réutilisée dans les prochaines phases avec Docker Compose et les services applicatifs du lab.

