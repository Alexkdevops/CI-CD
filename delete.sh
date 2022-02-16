#!/bin/bash
kubectl delete deploy api-deployment -n web
kubectl delete deploy api-deployment -n main
kubectl delete deploy api-deployment -n dev
kubectl delete deploy api-deployment -n prod
kubectl delete svc backend-api-svc  -n web
kubectl delete svc backend-api-svc  -n dev
kubectl delete svc backend-api-svc  -n prod
kubectl delete svc backend-api-svc  -n main
kubectl delete ns web prod main dev
#kubectl delete ns web prod main dev