function K = kinetic_energy(vcg, wcg, M, J)
    K = (vcg.'*M*vcg + wcg.'*J*wcg)/2;
end