classdef Dirigeable

    properties
        Data
        Axes
    end
    
    methods
        function obj = Dirigeable(data, axes)
            obj.Data = data;
            obj.Axes = axes;
        end
        
        function W = weight(obj)
            norm_W = - obj.Data("m_struct") * obj.Data("gravity");
            z_m = obj.Axes("z_m");
            W = norm_W * z_m;
        end

        function B = Buoyancy(obj)
            norm_B = obj.Data("rho") * obj.Data("v_struct") * obj.Data("gravity");
            z_m = obj.Axes("z_m");
            B = norm_B * z_m;
        end

        function plot(obj)

            %% ----------------------------------%%

            % avant
            vertices_1 = [
                2.2 0.5 -0.10; 
                1.8 0.5 -0.10;
                1.8 0.5 0.10;
                2.2 0.5 0.10;
                2.2 0.7 -0.10;
                1.8 0.7 -0.10;
                1.8 0.7 0.10;
                2.2 0.7 0.10];

            vertices_2 = [
                2.2 -0.5 -0.10; 
                1.8 -0.5 -0.10;
                1.8 -0.5 0.10;
                2.2 -0.5 0.10;
                2.2 -0.7 -0.10;
                1.8 -0.7 -0.10;
                1.8 -0.7 0.10;
                2.2 -0.7 0.10];
            
            % arrière
            vertices_3 = [
                -2.2 0.5 -0.10; 
                -1.8 0.5 -0.10;
                -1.8 0.5 0.10;
                -2.2 0.5 0.10;
                -2.2 0.7 -0.10;
                -1.8 0.7 -0.10;
                -1.8 0.7 0.10;
                -2.2 0.7 0.10];

            vertices_4 = [
                -2.2 -0.5 -0.10; 
                -1.8 -0.5 -0.10;
                -1.8 -0.5 0.10;
                -2.2 -0.5 0.10;
                -2.2 -0.7 -0.10;
                -1.8 -0.7 -0.10;
                -1.8 -0.7 0.10;
                -2.2 -0.7 0.10];

            %% ----------------------------------%%

            % avant
            vertices_T1 = [
                2.02 0.7 -0.02; 
                1.98 0.7 -0.02;
                1.98 0.7 0.02;
                2.02 0.7 0.02;
                2.02 0.9 -0.02;
                1.98 0.9 -0.02;
                1.98 0.9 0.02;
                2.02 0.9 0.02];

            vertices_T2 = [
                2.02 -0.7 -0.02; 
                1.98 -0.7 -0.02;
                1.98 -0.7 0.02;
                2.02 -0.7 0.02;
                2.02 -0.9 -0.02;
                1.98 -0.9 -0.02;
                1.98 -0.9 0.02;
                2.02 -0.9 0.02];

            % arrière
            vertices_T3 = [
                -2.02 0.7 -0.02; 
                -1.98 0.7 -0.02;
                -1.98 0.7 0.02;
                -2.02 0.7 0.02;
                -2.02 0.9 -0.02;
                -1.98 0.9 -0.02;
                -1.98 0.9 0.02;
                -2.02 0.9 0.02];

            vertices_T4 = [
                -2.02 -0.7 -0.02; 
                -1.98 -0.7 -0.02;
                -1.98 -0.7 0.02;
                -2.02 -0.7 0.02;
                -2.02 -0.9 -0.02;
                -1.98 -0.9 -0.02;
                -1.98 -0.9 0.02;
                -2.02 -0.9 0.02];

            %% ----------------------------------%%

            % avant
            vertices_mot_1 =[
                2.1 0.9 -0.05; 
                1.9 0.9 -0.05;
                1.9 0.9 0.05;
                2.1 0.9 0.05;
                2.1 1.1 -0.05;
                1.9 1.1 -0.05;
                1.9 1.1 0.05;
                2.1 1.1 0.05];

            vertices_mot_2 =[
                2.1 -0.9 -0.05; 
                1.9 -0.9 -0.05;
                1.9 -0.9 0.05;
                2.1 -0.9 0.05;
                2.1 -1.1 -0.05;
                1.9 -1.1 -0.05;
                1.9 -1.1 0.05;
                2.1 -1.1 0.05];

            % arrière
            vertices_mot_3 =[
                -2.1 0.9 -0.05; 
                -1.9 0.9 -0.05;
                -1.9 0.9 0.05;
                -2.1 0.9 0.05;
                -2.1 1.1 -0.05;
                -1.9 1.1 -0.05
                -1.9 1.1 0.05;
                -2.1 1.1 0.05];

            vertices_mot_4 =[
                -2.1 -0.9 -0.05; 
                -1.9 -0.9 -0.05;
                -1.9 -0.9 0.05;
                -2.1 -0.9 0.05;
                -2.1 -1.1 -0.05;
                -1.9 -1.1 -0.05;
                -1.9 -1.1 0.05;
                -2.1 -1.1 0.05];

            %% ----------------------------------%%

            % Indices des faces du cube
            faces = [1 2 3 4; % Bas
                     5 6 7 8; % Haut
                     1 2 6 5; % Côtés
                     2 3 7 6;
                     3 4 8 7;
                     4 1 5 8];

            
            % Dessiner le cube
            figure;
            hold on;
            axis equal;
            grid on;
            xlabel('X');
            ylabel('Y');
            zlabel('Z');
            title('Dirigeable');
            
            % CAO structure moteur
            patch('Vertices', vertices_1, 'Faces', faces, 'FaceColor', 'r', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_2, 'Faces', faces, 'FaceColor', 'r', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_3, 'Faces', faces, 'FaceColor', 'r', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_4, 'Faces', faces, 'FaceColor', 'r', 'FaceAlpha', 0.5);
            
            % CAO tube moteur
            patch('Vertices', vertices_T1, 'Faces', faces, 'FaceColor', 'b', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_T2, 'Faces', faces, 'FaceColor', 'b', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_T3, 'Faces', faces, 'FaceColor', 'b', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_T4, 'Faces', faces, 'FaceColor', 'b', 'FaceAlpha', 0.5);

            % moteur
            patch('Vertices', vertices_mot_1, 'Faces', faces, 'FaceColor', 'g', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_mot_2, 'Faces', faces, 'FaceColor', 'g', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_mot_3, 'Faces', faces, 'FaceColor', 'g', 'FaceAlpha', 0.5);
            patch('Vertices', vertices_mot_4, 'Faces', faces, 'FaceColor', 'g', 'FaceAlpha', 0.5);

            % Définir les axes pour l'ellipsoïde
            a = 3;  % Rayon le long de l'axe x
            b = 0.75;  % Rayon le long de l'axe y
            c = 0.75;  % Rayon le long de l'axe z
            
            % Créer un maillage pour les angles theta et phi
            [theta, phi] = meshgrid(linspace(0, 2*pi, 50), linspace(0, pi, 50));
            
            % Calculer les coordonnées x, y, z de l'ellipsoïde
            x = a * sin(phi) .* cos(theta);
            y = b * sin(phi) .* sin(theta);
            z = c * cos(phi);
            
            % Dessiner l'ellipsoïde
            h = surf(x, y, z);
            h.FaceColor = 'blue';  % Ellipsoïde de couleur bleue
            h.EdgeColor = 'none';  % Pas de lignes de grille
            h.FaceAlpha = 0.25;  % Transparence à 50%
            
            % Ajustements visuels
            view(3);  % Vue 3D

        end
        
    end
end